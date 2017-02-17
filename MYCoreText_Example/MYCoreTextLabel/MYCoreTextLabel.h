//
//  MYCoreTextLabel.h
//  图文混排demo
//
//  Created by 孟遥 on 2017/2/5.
//  Copyright © 2017年 孟遥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYAttributeModel.h"
/**
 事件回调

 @param linkString <#linkString description#>
 */
typedef void(^eventCallback)(NSString *linkString);

@protocol MYCoreTextLabelDelegate <NSObject>

@optional

- (void)linkText:(NSString *)clickString type:(MYLinkType)linkType;

@end

@interface MYCoreTextLabel : UIView

/**
 链接属性 ，如不设置 ， 默认14号字体 ， 默认链接字颜色为蓝色 ， 内容字颜色为黑色
 */
@property (nonatomic, strong) MYAttributeModel *attribute;

/**
 代理
 */
@property (nonatomic, weak) id<MYCoreTextLabelDelegate> delegate;

/**
 内容添加链接 , 如不需要额外的指定链接 , customLinks传nil ,默认显示常规链接 @ #话题#  web 
 你可以通过attribute的shouldShowNormLink属性设置是否显示最常规的链接

 @param text       <#text description#>
 @param customLinks <#otherlinks description#>
 */
- (void)text:(NSString *)text customLinks:(NSArray<NSString *> *)customLinks;

@end
