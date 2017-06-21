//
//  LinksViewController.m
//  复杂demo
//
//  Created by 孟遥 on 2017/2/14.
//  Copyright © 2017年 mengyao. All rights reserved.
//

#import "LinksViewController.h"
#import "MYCoreTextLabel.h"

@interface LinksViewController ()<MYCoreTextLabelDelegate>

@property (nonatomic, strong) MYCoreTextLabel *coretextLabel;

@end

@implementation LinksViewController

- (MYCoreTextLabel *)coretextLabel
{
    if (!_coretextLabel) {
        _coretextLabel = [[MYCoreTextLabel alloc]init];
        _coretextLabel.delegate = self;
        
        //是否匹配网址链接 , 以及相关设置
        _coretextLabel.showWebLink = YES;
        _coretextLabel.webLinkBackColor = [UIColor redColor];  //设置网址链接点击背景色
        _coretextLabel.webLinkFont = [UIFont systemFontOfSize:20]; //设置网址链接的字体大小
        _coretextLabel.webLinkColor = [UIColor greenColor]; //设置网址链接的颜色
        
        //设置自定义点击链接为  @"哥哥"
        [_coretextLabel setText:@"阿南。#测试#现在每次吃栗子我都会想起父亲，想起小时候每到深秋，父亲#测试#在地里干农活都会在家乡的山间摘好多野栗子回来给我吃，他不给哥哥吃，他自己也不吃。只给我一个人吃。看到你在书里写给阿明的信，好几次我都哽咽了。阿明尚ww.dsa.cn且对你如此，可你却还的如此的爱他www.baidu.com。可对于我的父亲，我深觉自己做的这www.google.cn些微不足道，甚至不值一提。去年他动手术，我和哥哥送他去医院，晚上，我和哥哥离开，只留他#测试#一人在医院。第二日，我去医院@小明 看到手术后的他躺在病床上憔悴不已。母亲守在一旁。心揪成一团。三个月前哥哥大婚，看他和母亲忙前忙后，看到他满脸的胡渣以及母亲双鬓若隐若现的白发。更是心痛不已。www.123.com" customLinks:@[@"哥哥"] keywords:nil];
    }
    return _coretextLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"只展示链接,其他不展示";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.coretextLabel];
    CGSize size = [self.coretextLabel sizeThatFits:CGSizeMake(200, 600)];
    self.coretextLabel.frame = CGRectMake(100, 100, size.width, size.height);
}


- (void)linkText:(NSString *)clickString type:(MYLinkType)linkType
{
    NSLog(@"----------点击内容是 : %@--------链接类型是 : %li",clickString,linkType);
}

@end
