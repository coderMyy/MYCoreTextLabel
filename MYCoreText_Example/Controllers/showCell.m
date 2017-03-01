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
        MYAttributeModel *model = [[MYAttributeModel alloc]init];  //创建属性模型
        model.textFont = [UIFont systemFontOfSize:15.f];   //设置普通内容文字大小
        model.textColor = [UIColor brownColor];   // 设置普通内容文字颜色
        model.norLinkFont = [UIFont systemFontOfSize:18.f];  //设置常规链接字体大小  @ #话题# www.baidu.com 网址类型
        model.norLinkColor = [UIColor blueColor];  //设置常规链接字体颜色
        model.norLinkBackColor = [UIColor redColor];  //设置常规链接点击背景色
        model.customLinkFont = [UIFont systemFontOfSize:18.f];  //设置自定义链接字 字体大小
        model.customLinkColor = [UIColor greenColor];  //设置自定义链接字体颜色
        model.customLinkBackColor = [UIColor orangeColor];  //设置自定义链接点击背景色
        model.keyWord = @"如果喜欢请点一下star噢";   //设置关键字
        model.keyWordColor = [UIColor redColor];  //设置关键字颜色
        model.keyWordBackColor = [UIColor blueColor];  //设置关键字高亮背景色
        model.notShowNormalLink = NO;  // 不显示常规链接 , 默认为NO  即默认显示常规链接 , 如果不需要显示 , 赋值为YES即可
        model.lineSpacing = 5;   //设置行间距
        model.wordSpacing = 0.5; //设置字间距
        _coretextLabel.attribute = model;  //将配置好单属性模型赋值给coretextLabel
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
    [self.coretextLabel text:model.text customLinks:@[@"朋友圈",@"即时通讯"]];
    //计算高度
    CGSize size = [self.coretextLabel sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    self.coretextLabel.frame = CGRectMake(0, 20, size.width, size.height);
    model.height = size.height + 40;
}


- (void)linkText:(NSString *)clickString type:(MYLinkType)linkType
{
    NSLog(@"------------%@--------------%li",clickString,linkType);
}


@end
