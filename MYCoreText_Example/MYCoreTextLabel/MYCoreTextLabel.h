//
//  MYCoreTextLabel.h
//  图文混排demo
//
//  Created by 孟遥 on 2017/2/5.
//  Copyright © 2017年 孟遥. All rights reserved.

/**
 
 Github地址 : https://github.com/coderMyy/MYCoreTextLabel 求Star , Fork .....
 博客地址    : http://blog.csdn.net/codermy  , 偶尔会记录一下学习的东西 .
 
*/

#import <UIKit/UIKit.h>
#import "MYCoretextResultTool.h"

@class MYCoreTextLabel;

@protocol MYCoreTextLabelDelegate <NSObject>

@optional

//链接点击回调
- (void)coreTextLabelLinkTouch:(MYCoreTextLabel *)coreTextLabel link:(NSString *)linkString type:(MYLinkType)linkType;
//除开链接以外点击回调
- (void)coreTextLabelBlankTouch:(MYCoreTextLabel *)coreTextLabel ;

@end




@interface MYCoreTextLabel : UIView

+ (instancetype)coreTextLabel;

/**
 开始渲染
 
 @param maxWidth <#maxWidth description#>
 @param maxHeight <#maxHeight description#>
 @return <#return value description#>
 */
- (CGSize)renderForMaxWith:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight;

//代理
@property (nonatomic, weak) id<MYCoreTextLabelDelegate> delegate;

#pragma mark ---------------*******************************---------------- 普通文本部分属性  例 : 这是一个测试句子
//内容
@property (nonatomic, copy) NSString *text;
//关键字
@property (nonatomic, strong) NSArray<NSString *> *keywords;
//自定义链接内容（指定某些内容可点击）
@property (nonatomic, strong) NSArray<NSString *> *customLinks;
//指定链接区间(指定某些区间的内容可点击，多用于类似微信朋友圈 aaa回复了bbb)
@property (nonatomic, strong) NSArray<NSValue *> *cusLinkRanges;
//内容字体大小（除开链接特殊字以外内容的字体大小）,默认14.f
@property (nonatomic, strong) UIFont *textFont;
//内容字体颜色（除开链接特殊字以外的内容）,默认黑色
@property (nonatomic, strong) UIColor *textColor;
//内容行间距
@property (nonatomic, assign) CGFloat lineSpacing;
//字间距
@property (nonatomic, assign) CGFloat wordSpacing;
//表情/图片尺寸大小 ,默认和字体一致
@property (nonatomic, assign) CGSize imageSize;
//链接点中背景透明度
@property (nonatomic, assign) CGFloat linkBackAlpha;

#pragma mark ---------------*******************************---------------- 网址链接属性  例 : www.baidu.com
//是否匹配网址链接,默认为NO
@property (nonatomic, assign) BOOL showWebLink;
//网址链接字体颜色   默认蓝色
@property (nonatomic, strong) UIColor *webLinkColor;
//网址链接字体大小    默认14.f
@property (nonatomic, strong) UIFont *webLinkFont;
//常规链接选中背景色  默认蓝色
@property (nonatomic, strong) UIColor *webLinkBackColor;

#pragma mark ---------------*******************************---------------- 话题链接属性   例 : #话题#
//是否显示话题链接,默认为NO
@property (nonatomic, assign) BOOL showTopicLink;
//常规链接字体颜色     默认蓝色
@property (nonatomic, strong) UIColor *topicLinkColor;
//常规链接字体大小     默认14.f
@property (nonatomic, strong) UIFont *topicLinkFont;
//常规链接选中背景色   默认蓝色
@property (nonatomic, strong) UIColor *topicLinkBackColor;

#pragma mark ---------------*******************************---------------- @链接属性   例 : @小明
//是否显示@链接,默认为NO
@property (nonatomic, assign) BOOL showTrendLink;
//@链接字体颜色      默认蓝色
@property (nonatomic, strong) UIColor *trendLinkColor;
//@链接字体大小      默认14.f
@property (nonatomic, strong) UIFont *trendLinkFont;
//@链接选中背景色   默认蓝色
@property (nonatomic, strong) UIColor *trendLinkBackColor;

#pragma mark ---------------*******************************---------------- 邮箱链接属性   例 : mengyao_block@outlook.com
//是否显示邮箱链接,默认为NO
@property (nonatomic, assign) BOOL showMailLink;
//邮箱链接字体颜色     默认蓝色
@property (nonatomic, strong) UIColor *mailLinkColor;
//邮箱链接字体大小     默认14.f
@property (nonatomic, strong) UIFont *mailLinkFont;
//邮箱链接选中背景色  默认蓝色
@property (nonatomic, strong) UIColor *mailLinkBackColor;

#pragma mark ---------------*******************************---------------- 手机号链接属性   例 : 139xxxxx834
//是否显示手机链接,默认为NO
@property (nonatomic, assign) BOOL showPhoneLink;
//手机链接字体颜色     默认蓝色
@property (nonatomic, strong) UIColor *phoneLinkColor;
//手机链接字体大小     默认14.f
@property (nonatomic, strong) UIFont *phoneLinkFont;
//手机链接选中背景色  默认蓝色
@property (nonatomic, strong) UIColor *phoneLinkBackColor;

#pragma mark ---------------*******************************---------------- 自定义链接属性   例 : 这是一个自定义链接  (自定义链接)
//额外指定链接文字颜色 默认蓝色
@property (nonatomic, strong) UIColor *customLinkColor;
//额外指定链接文字大小 , 默认 14.f
@property (nonatomic, strong) UIFont *customLinkFont;
//额外指定链接文字选中背景 , 默认蓝色
@property (nonatomic, strong) UIColor *customLinkBackColor;

#pragma mark ---------------*******************************---------------- 关键字部分属性
//关键字颜色 , 默认黑色
@property (nonatomic, strong) UIColor *keyWordColor;
//关键字字体大小, 默认 14.f
@property (nonatomic, strong) UIFont *keywordFont;
//关键字背景色 , 默认黄色
@property (nonatomic, strong) UIColor *keyWordBackColor;

@end
