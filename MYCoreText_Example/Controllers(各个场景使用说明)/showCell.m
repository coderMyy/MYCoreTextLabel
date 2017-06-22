//
//  showCell.m
//  MYCoreText使用范例
//
//  Created by 孟遥 on 2017/2/16.
//  Copyright © 2017年 mengyao. All rights reserved.
//

#import "showCell.h"
#import "MYCoreTextLabel.h"
#import "tableViewModel.h"

@interface showCell ()<MYCoreTextLabelDelegate>

@property (nonatomic, strong) MYCoreTextLabel *coretextLabel;

@end


@implementation showCell

- (MYCoreTextLabel *)coretextLabel
{
    if (!_coretextLabel) {
        _coretextLabel = [[MYCoreTextLabel alloc]init];
        
        //设置普通文本的属性
        _coretextLabel.textFont = [UIFont systemFontOfSize:15.f];   //设置普通内容文字大小
        _coretextLabel.textColor = [UIColor brownColor];   // 设置普通内容文字颜色
        _coretextLabel.lineSpacing = 5;   //设置行间距
        _coretextLabel.wordSpacing = 0.5; //设置字间距
        
        
        //设置网址链接的属性
        _coretextLabel.showWebLink  = YES;
        _coretextLabel.webLinkFont = [UIFont systemFontOfSize:18.f];  //设置网址链接字体大小
        _coretextLabel.webLinkColor = [UIColor blueColor];  //设置网址链接字体颜色
        _coretextLabel.webLinkBackColor = [UIColor redColor];  //设置网址链接点击背景色
        
        
        
        //设置 #话题#的属性
        _coretextLabel.showTopicLink = YES;
        _coretextLabel.topicLinkFont = [UIFont systemFontOfSize:15.f];
        _coretextLabel.topicLinkColor = [UIColor redColor];
        _coretextLabel.topicLinkBackColor = [UIColor blackColor];
        
        
        //设置 @ 的属性
        _coretextLabel.showTrendLink = YES;
        _coretextLabel.trendLinkFont = [UIFont systemFontOfSize:18];
        _coretextLabel.trendLinkColor = [UIColor purpleColor];
        _coretextLabel.trendLinkBackColor = [UIColor darkGrayColor];
        
        
        //设置邮箱的属性
        _coretextLabel.showMailLink = YES;
        _coretextLabel.mailLinkFont = [UIFont systemFontOfSize:18.f];
        _coretextLabel.mailLinkColor = [UIColor redColor];
        _coretextLabel.mailLinkBackColor = [UIColor greenColor];
        
        //设置手机号的属性
        _coretextLabel.showPhoneLink = YES;
        _coretextLabel.phoneLinkFont = [UIFont systemFontOfSize:15.f];
        _coretextLabel.phoneLinkColor = [UIColor redColor];
        _coretextLabel.phoneLinkBackColor = [UIColor blueColor];
        
        //设置自定义链接的属性
        _coretextLabel.customLinkFont = [UIFont systemFontOfSize:18.f];  //设置自定义链接字 字体大小
        _coretextLabel.customLinkColor = [UIColor greenColor];  //设置自定义链接字体颜色
        _coretextLabel.customLinkBackColor = [UIColor orangeColor];  //设置自定义链接点击背景色
        
        //设置关键字的属性
        _coretextLabel.keywordFont = [UIFont systemFontOfSize:15];
        _coretextLabel.keyWordColor = [UIColor blueColor];  //设置关键字颜色
        _coretextLabel.keyWordBackColor = [UIColor yellowColor];  //设置关键字高亮背景色
        
        _coretextLabel.delegate = self;   //设置代理 , 用于监听点击事件 以及接收点击内容等
    }
    return _coretextLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.coretextLabel];
    }
    return self;
}



- (void)setModel:(tableViewModel *)model
{
    _model = model;
    
    //赋值
    [self.coretextLabel setText:model.text customLinks:@[@"一个自定义链接",@"另外一个自定义链接"] keywords:@[@"关键字",@"star",@"fork"]];
    //计算高度
    CGSize size = [self.coretextLabel sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    self.coretextLabel.frame = CGRectMake(0, 20, size.width, size.height);
    model.height = size.height + 40;
}


- (void)linkText:(NSString *)clickString type:(MYLinkType)linkType
{
    NSLog(@"------------点击内容是 : %@--------------链接类型是 : %li",clickString,linkType);
}


@end
