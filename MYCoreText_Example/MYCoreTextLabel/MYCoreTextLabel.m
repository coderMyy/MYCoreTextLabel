//
//  MYCoreTextLabel.m
//  图文混排demo
//
//  Created by 孟遥 on 2017/2/5.
//  Copyright © 2017年 孟遥. All rights reserved.
//

#define linkCoverTag    998
#define keyWordCoverTag 1998
#define normalLinkTag @"normalLinkTag"
#import "MYCoreTextLabel.h"
#import "MYCoretextResultTool.h"


@interface MYCoreTextLabel ()

@property (nonatomic, strong) UITextView *contentTextView;    //文本view
@property (nonatomic, strong) NSMutableArray<MYLinkModel *> *links;   //所有的链接模型
@property (nonatomic, strong) NSMutableArray<MYSubCoretextResult *> *allResults;//所有结果
@property (nonatomic, copy) eventCallback touchCallback;      //点击链接回调
@property (nonatomic, copy) NSString *text; //文本
@property (nonatomic, strong) NSArray *customLinks; //其他链接
@property (nonatomic, strong) MYLinkModel *currentTouchLink; //记录当前手指所在链接模型
@property (nonatomic, strong) NSMutableArray *norLinksCache; //常规链接模型临时存储
@property (nonatomic, strong) NSMutableArray *keywordsCovers;
@property (nonatomic, assign,getter=isKeywordConfiged) BOOL keywordConfig; //临时记录
@end

@implementation MYCoreTextLabel

- (NSMutableArray *)norLinksCache
{
    if (!_norLinksCache) {
        _norLinksCache = [NSMutableArray array];
    }
    return _norLinksCache;
}

- (UITextView *)contentTextView
{
    if (!_contentTextView) {
        _contentTextView = [[UITextView alloc]init];
        _contentTextView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _contentTextView.editable = NO;
        _contentTextView.userInteractionEnabled = NO;
        _contentTextView.scrollEnabled = NO;
        _contentTextView.backgroundColor = [UIColor clearColor];
    }
    return _contentTextView;
}

//所有结果集
- (NSMutableArray<MYSubCoretextResult *> *)allResults
{
    if (!_allResults) {
        
        //配置自定义链接
        [MYCoretextResultTool customLinks:self.customLinks];
        //配置关键字
        [MYCoretextResultTool keyWord:self.attribute.keyWord];
        
        _allResults = [MYCoretextResultTool subTextWithEmotion:self.text];
    }
    return _allResults;
}

- (NSMutableArray<MYLinkModel *> *)links
{
    if (!_links) {
        _links = [NSMutableArray array];
        
        [self.contentTextView.attributedText enumerateAttribute:normalLinkTag inRange:NSMakeRange(0, self.contentTextView.attributedText.length) options:0 usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
           
            NSString *linkString    = value;
            if ([linkString isEqualToString:self.attribute.keyWord]) return ;//屏蔽关键字
            if (linkString.length) {
                
                MYLinkModel *link      = [[MYLinkModel alloc]init];
                link.range             = range;
                link.linkText          = linkString;
                //设置链接类型
                if ([_customLinks containsObject:linkString]) {
                    link.linkType      = MYLinkTypeCustomLink;
                }
                //普通链接类型
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"linkText = %@",linkString];
                NSArray * norResults   = [self.norLinksCache filteredArrayUsingPredicate:predicate];
                MYLinkModel *cachelink = norResults.firstObject;
                if (cachelink) {
                    link.linkType      = cachelink.linkType;
                }
                //处理异常
                if ((link.linkType == MYLinkTypetTrendLink||link.linkType == MYLinkTypetTopicLink||link.linkType == MYLinkTypetWebLink)&&self.attribute.notShowNormalLink) return;
                
                self.contentTextView.selectedRange = range;
                NSArray *selectedRects = [self.contentTextView selectionRectsForRange:self.contentTextView.selectedTextRange];
                NSMutableArray *rects  = [NSMutableArray array];
                for (UITextSelectionRect *rect  in selectedRects) {
                    
                    if (!rect.rect.size.width||!rect.rect.size.height) continue;
                    [rects addObject:rect];
                }
                link.rects = rects;
                [_links addObject:link];
            }
        }];
    }
    return _links;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.contentTextView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.contentTextView.frame = self.bounds;
    if (self.isKeywordConfiged) return;
    //设置高亮关键字
      [self keyWord:[[NSMutableAttributedString alloc]initWithAttributedString:self.contentTextView.attributedText]];
    self.keywordConfig = YES;
}



#pragma mark - 添加链接,公共接口
- (void)text:(NSString *)text customLinks:(NSArray<NSString *> *)customLinks
{
    _text        = text;
    _customLinks = customLinks;
    if (!self.attribute) return;
    //复用处理
    [self reuseHandle];
    [self configAttribute:text];
}


#pragma mark - 设置相关属性
- (void)setAttribute:(MYAttributeModel *)attribute
{
    _attribute = attribute;
    //矫正属性
    [self judge:attribute];
    if (!self.text.length) return;
    //复用处理
    [self reuseHandle];
    [self configAttribute:self.text];
}


#pragma mark - 配置属性
- (void)configAttribute:(NSString *)text
{
    
     NSMutableAttributedString *stringM = [[NSMutableAttributedString alloc]init];
    //遍历结果集
    [self.allResults enumerateObjectsUsingBlock:^(MYSubCoretextResult * _Nonnull result, NSUInteger idx, BOOL * _Nonnull stop) {
        
        //表情
        if (result.isEmotion) {
           
            //图片富文本
            NSTextAttachment *attachmeent = [[NSTextAttachment alloc]init];
            UIImage *emotionImage = [UIImage imageNamed:result.string];
            if (emotionImage) { //有对应表情
             
                attachmeent.image   = emotionImage;
                attachmeent.bounds  = CGRectMake(0, -3, self.attribute.imageSize.width, self.attribute.imageSize.height);
                NSAttributedString *imageString = [NSAttributedString attributedStringWithAttachment:attachmeent];
                [stringM appendAttributedString:imageString];
            }else{
                NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:result.string];
                [self normalTextAttribute:string];
                [stringM appendAttributedString:string];
            }
            
        }else{ //非表情
            
            //设置文本属性
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:result.string];
            //普通文本属性
            [self normalTextAttribute:string];
            //设置链接属性
            if (result.links.count) {
             
                for (MYLinkModel *link in result.links) { // 14-4 2-7 2-21
                    //标记
                    [string addAttribute:normalLinkTag value:[result.string substringWithRange:link.range] range:link.range];
                    //记录常规链接
                    [self.norLinksCache addObject:link];
                    if (link.linkType == MYLinkTypeCustomLink) {
                     
                        //自定义链接设置属性
                        [self customLinkAttribute:string range:link.range];
                        continue;
                    }
                    //关键字设置属性
                    if (link.linkType == MYLinkTypeKeyword){
                        [string addAttribute:NSForegroundColorAttributeName value:self.attribute.keyWordColor range:link.range];
                        continue;
                    };
                    
                    if (self.attribute.notShowNormalLink) continue;
                    //常规链接设置属性
                    [self normalLinkAttribute:string range:link.range];
                }
            }
            [stringM appendAttributedString:string];
        }
    }];
    self.contentTextView.attributedText = stringM;
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch         = [touches anyObject];
    CGPoint touchPoint     = [touch locationInView:self.contentTextView];
    MYLinkModel *linkModel = [self selectedLink:touchPoint];
    [self addSelectedAnimation:linkModel];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissAnimation];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *moveTouch  = [touches anyObject];
    CGPoint movePoint   = [moveTouch locationInView:moveTouch.view];
    
    BOOL isContained    = NO;
    for (UITextSelectionRect *rect in self.currentTouchLink.rects) {
        if (CGRectContainsPoint(rect.rect, movePoint)) {
            isContained = YES;
        }
    }
    if (!isContained) {
     [self dismissAnimation];
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissAnimation];
}


#pragma mark - 获取点击链接模型
- (MYLinkModel *)selectedLink:(CGPoint)touchPoint
{
    
    MYLinkModel *linkModel = nil;
    for (MYLinkModel *link in self.links) {
        
        for (UITextSelectionRect *rect in link.rects) {
            
            if (CGRectContainsPoint(rect.rect, touchPoint)) {
                
                linkModel             = link;
                self.currentTouchLink = link; //记录当前点击
                //回调内容
                if ([self.delegate respondsToSelector:@selector(linkText:type:)]) {
                    [self.delegate linkText:link.linkText type:link.linkType];
                }
                break;
            }
        }
    }
    return linkModel;
}

#pragma mark - 点击效果
- (void)addSelectedAnimation:(MYLinkModel *)linkModel
{
    
    UIColor *linkBackColor = self.attribute.norLinkBackColor;
    if (linkModel.linkType == MYLinkTypeCustomLink) {
        linkBackColor      = self.attribute.customLinkBackColor;
    }
    [linkModel.rects enumerateObjectsUsingBlock:^(UITextSelectionRect * _Nonnull rect, NSUInteger idx, BOOL * _Nonnull stop) {
       
        UIView *coverView            = [[UIView alloc]init];
        coverView.backgroundColor    = linkBackColor;
        coverView.alpha              = self.attribute.linkBackAlpha;
//        CGRect frame                 = rect.rect;
//        frame.size.height            = self.contentTextView.font.lineHeight;
        coverView.frame              = rect.rect;
        coverView.tag                = linkCoverTag;
        coverView.layer.cornerRadius = 3.f;
        coverView.clipsToBounds      = YES;
        [self insertSubview:coverView atIndex:0];
    }];
}

#pragma mark - 点击动画
- (void)dismissAnimation
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        for (UIView *coverView in self.subviews) {
            if (coverView.tag == linkCoverTag) {
                [coverView removeFromSuperview];
            }
        }
    });
}


#pragma mark - 常规链接属性设置
- (void)normalLinkAttribute:(NSMutableAttributedString *)attriteStr range:(NSRange)linkRange
{
    [attriteStr addAttribute:NSForegroundColorAttributeName value:self.attribute.norLinkColor range:linkRange];
    [attriteStr addAttribute:NSFontAttributeName value:self.attribute.norLinkFont range:linkRange];
}

#pragma mark - 特殊指定字符链接属性设置
- (void)customLinkAttribute:(NSMutableAttributedString *)attributeStr range:(NSRange)linkRange
{

    [attributeStr addAttribute:NSFontAttributeName value:self.attribute.customLinkFont range:linkRange];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:self.attribute.customLinkColor range:linkRange];
}

#pragma mark - 普通文本属性设置
- (void)normalTextAttribute:(NSMutableAttributedString *)attributeStr
{
    [attributeStr addAttribute:NSFontAttributeName value:self.attribute.textFont range:NSMakeRange(0, attributeStr.length)];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:self.attribute.textColor range:NSMakeRange(0, attributeStr.length)];
    NSMutableParagraphStyle *paragra = [[NSMutableParagraphStyle alloc]init];
    [paragra setLineBreakMode:NSLineBreakByCharWrapping];
    [paragra setLineSpacing:self.attribute.lineSpacing];
    [attributeStr addAttribute:NSParagraphStyleAttributeName value:paragra range:NSMakeRange(0, attributeStr.length)];
    [attributeStr addAttribute:NSKernAttributeName value:@(self.attribute.wordSpacing) range:NSMakeRange(0, attributeStr.length)];
}

#pragma mark - 高亮关键字设置
- (void)keyWord:(NSMutableAttributedString *)attributeStr
{
    
    if (!self.attribute.keyWord.length) return;
    [attributeStr enumerateAttribute:normalLinkTag inRange:NSMakeRange(0, attributeStr.length) options:0 usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
       
        NSString *str = value;
        if (![str isEqualToString:self.attribute.keyWord]||!range.length) return ;
            
            //计算选中区域
            self.contentTextView.selectedRange = range;
            NSArray *coverRects = [self.contentTextView selectionRectsForRange:self.contentTextView.selectedTextRange];
            for (UITextSelectionRect *rect in coverRects) {
                if (!rect.rect.size.width||!rect.rect.size.height) continue;
                UIView *keywordView            = [[UIView alloc]init];
                keywordView.backgroundColor    = self.attribute.keyWordBackColor;
                keywordView.alpha              = self.attribute.linkBackAlpha;
                keywordView.layer.cornerRadius = 3.f;
                keywordView.clipsToBounds      = YES;
                keywordView.tag                = keyWordCoverTag;
//                CGRect   frame                 = rect.rect;
//                frame.size.height              = self.contentTextView.font.lineHeight + 2.f;
                keywordView.frame              = rect.rect;
                [self insertSubview:keywordView atIndex:0];
            }
     }];
}

#pragma mark - 判断属性
- (void)judge:(MYAttributeModel *)attributeModel
{
    //文本内容
    if (!attributeModel.textFont) {
        self.attribute.textFont            = [UIFont systemFontOfSize:14.f];
    }
    if (!attributeModel.textColor) {
        self.attribute.textColor           = [UIColor blackColor];
    }
    if (!attributeModel.imageSize.width||!attributeModel.imageSize.height) {
        attributeModel.imageSize           = CGSizeMake(self.attribute.textFont.lineHeight, self.attribute.textFont.lineHeight);
    }
    if (!attributeModel.linkBackAlpha) {
        self.attribute.linkBackAlpha       = 0.5f;
    }

    //常规链接
    if (!attributeModel.norLinkFont) {
        self.attribute.norLinkFont         = self.attribute.textFont;
    }
    if (!attributeModel.norLinkColor) {
        self.attribute.norLinkColor        = [UIColor blueColor];
    }
    if (!attributeModel.norLinkBackColor) {
        self.attribute.norLinkBackColor    = [UIColor blueColor];
    }
    
    //自定义链接
    if (!attributeModel.customLinkFont) {
        self.attribute.customLinkFont      = self.attribute.textFont;
    }
    if (!attributeModel.customLinkColor) {
        self.attribute.customLinkColor     = [UIColor blueColor];
    }
    if (!attributeModel.customLinkBackColor) {
        self.attribute.customLinkBackColor = [UIColor blueColor];
    }
    //关键字
    if (!attributeModel.keyWordColor) {
        self.attribute.keyWordColor        = [UIColor blackColor];
    }
    if (!attributeModel.keyWordBackColor) {
        self.attribute.keyWordBackColor    = [UIColor yellowColor];
    }
}

#pragma mark - 计算尺寸
- (CGSize)sizeThatFits:(CGSize)size
{
    if (!self.contentTextView.attributedText.length) {
        return CGSizeZero;
    }
    CGSize viewSize = [self.contentTextView sizeThatFits:CGSizeMake(size.width, size.height)];
    return viewSize;
}


#pragma mark - 复用处理
- (void)reuseHandle
{
    self.allResults    = nil;
    self.links         = nil;
    self.keywordConfig = NO;
    for (UIView *view in self.subviews) {
        
        if (view.tag == keyWordCoverTag) {
         [view removeFromSuperview];
        }
    }
}

@end
