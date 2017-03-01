//
//  MYAttributeModel.h
//  图文混排demo
//
//  Created by 孟遥 on 2017/2/8.
//  Copyright © 2017年 孟遥. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,MYLinkType){
    MYLinkTypetTrendLink = 1<<0,
    MYLinkTypetTopicLink = 2<<0,
    MYLinkTypetWebLink   = 3<<0,
    MYLinkTypeCustomLink = 4<<0,
    MYLinkTypeKeyword    = 5<<0
};

@interface MYAttributeModel : NSObject


/**
 表情/图片尺寸大小 ,默认和字体一致
 */
@property (nonatomic, assign) CGSize imageSize;

/**
 是否需要展示常规链接  如 http  @xx   #话题#   默认为YES ,如不需要展示常规链接，必须赋值为NO
 */
@property (nonatomic, assign) BOOL notShowNormalLink;
/**
 链接点中背景透明度
 */
@property (nonatomic, assign) CGFloat linkBackAlpha;

#pragma mark - 普通文本部分属性
/**
 内容字体大小（除开链接特殊字以外内容的字体大小）,默认14.f
 */
@property (nonatomic, strong) UIFont *textFont;

/**
 内容字体颜色（除开链接特殊字以外的内容）,默认黑色
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 内容行间距
 */
@property (nonatomic, assign) CGFloat lineSpacing;

/**
 字间距
 */
@property (nonatomic, assign) CGFloat wordSpacing;

#pragma mark - 常规链接部分属性
/**
 常规链接字体颜色   http  @xx   #话题#  默认蓝色
 */
@property (nonatomic, strong) UIColor *norLinkColor;

/**
  常规链接字体大小   http  @xx   #话题#  默认14.f
 */
@property (nonatomic, strong) UIFont *norLinkFont;
/**
 常规链接选中背景色 http  @xx   #话题#  默认蓝色 ， 透明度 0.5
 */
@property (nonatomic, strong) UIColor *norLinkBackColor;

#pragma mark - 自定义链接部分属性
/**
  额外指定链接文字颜色 默认蓝色
 */
@property (nonatomic, strong) UIColor *customLinkColor;

/**
 额外指定链接文字大小 , 默认 14.f
 */
@property (nonatomic, strong) UIFont *customLinkFont;

/**
 额外指定链接文字选中背景 , 默认蓝色
 */
@property (nonatomic, strong) UIColor *customLinkBackColor;

#pragma mark - 关键字部分属性

/**
 关键字内容
 */
@property (nonatomic, copy) NSString *keyWord;

/**
 关键字颜色,默认黑色
 */
@property (nonatomic, strong) UIColor *keyWordColor;

/**
 关键字背景色 , 默认黄色
 */
@property (nonatomic, strong) UIColor *keyWordBackColor;
@end
