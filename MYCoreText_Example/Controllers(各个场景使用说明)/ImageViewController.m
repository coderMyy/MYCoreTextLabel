//
//  ImageViewController.m
//  复杂demo
//
//  Created by 孟遥 on 2017/2/14.
//  Copyright © 2017年 mengyao. All rights reserved.
//

#import "ImageViewController.h"
#import "MYCoreTextLabel.h"

@interface ImageViewController ()

@property (nonatomic, strong) MYCoreTextLabel *coreTextLabel;

@property (nonatomic, strong) MYCoreTextLabel *bigImageTextLabel;

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ImageViewController

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 1200);
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}

- (MYCoreTextLabel *)coreTextLabel
{
    if (!_coreTextLabel) {
        _coreTextLabel = [[MYCoreTextLabel alloc]init];
        _coreTextLabel.imageSize = CGSizeMake(25, 25);  // 设置图片尺寸 , 默认和字体一样
        
        //设置普通文本属性
        _coreTextLabel.textFont  = [UIFont systemFontOfSize:16.f]; //设置普通文本大小 , 默认14.f
        _coreTextLabel.textColor = [UIColor brownColor]; //设置普通文本字体颜色 , 默认黑色
        _coreTextLabel.lineSpacing = 5;  //设置行间距
        _coreTextLabel.wordSpacing = 2;  //设置字间距
        
        
        //如果不需要任何的自定义链接和关键字, 赋值nil即可
        [_coreTextLabel setText:@"满街脚步突然静[调皮]了,满天柏树突然没有[白眼]动摇,这一刹[擦汗]我只需要一罐热茶吧,那味道似是[滑稽]什么都不紧要,唱片店内[擦汗]传来异国民谣,那种快乐[白眼]突然被我需要,不亲切[调皮]至少不似想你般[龇牙]奥妙,情和调随著怀缅变得萧条,原来过得很快乐[擦汗],[白眼]只我一人未发觉,如能忘掉渴望,[花心]岁月长衣裳薄,无论于什么角落[噘嘴],不假设你或会在旁,我也可畅游异国放心吃喝[调皮][调皮][调皮]" customLinks:nil keywords:nil];
    }
    return _coreTextLabel;
}

- (MYCoreTextLabel *)bigImageTextLabel
{
    if (!_bigImageTextLabel) {
        _bigImageTextLabel = [[MYCoreTextLabel alloc]init];
        
        _bigImageTextLabel.imageSize = CGSizeMake(120, 120);  // 设置图片尺寸 , 默认和字体一样
        
        //设置普通文本属性
        _bigImageTextLabel.textFont  = [UIFont systemFontOfSize:18.f]; //设置普通文本大小 , 默认14.f
        _bigImageTextLabel.textColor = [UIColor brownColor]; //设置普通文本字体颜色 , 默认黑色
        _bigImageTextLabel.lineSpacing = 8;  //设置行间距
        _bigImageTextLabel.wordSpacing = 2;  //设置字间距
        
        
        
        //如果不需要任何的自定义链接和关键字, 赋值nil即可
        [_bigImageTextLabel setText:@"这一刹我只需要一罐热茶吧,那味道似是什么都不紧要.[图片1]唱片店内传来异国民谣,那种快乐突然被我需要[图片2],不亲切至少不似想你般奥妙,情和调随著怀缅变得萧条,原来过得很快乐,只我一人未发觉,如能忘掉渴望[图片4],岁月长衣裳薄,无论于什么角落[图片3]" customLinks:nil keywords:nil];
    }
    return _bigImageTextLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"只展示图片/表情,其他链接不展示";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
    
    //frame
    CGSize size = [self.coreTextLabel sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.coreTextLabel.frame = CGRectMake(0, 70, size.width, size.height);
    [self.scrollView addSubview:self.coreTextLabel];
    
    CGSize size1 = [self.bigImageTextLabel sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.bigImageTextLabel.frame = CGRectMake(0, 400, size1.width, size1.height);
    [self.scrollView addSubview:self.bigImageTextLabel];
}




@end
