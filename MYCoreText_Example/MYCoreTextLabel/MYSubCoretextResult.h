//
//  MYSubCoretextResult.h
//  图文混排demo
//
//  Created by 孟遥 on 2017/2/12.
//  Copyright © 2017年 孟遥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYAttributeModel.h"

@interface MYSubCoretextResult : NSObject

@property (nonatomic, strong) NSString *string; //切割表情字符串
@property (nonatomic, assign) NSRange range;  //切割表情集range
@property (nonatomic, assign,getter=isEmotion) BOOL isEmotion;
@property (nonatomic, strong) NSArray *links; //每个结果里包含的链接
@end


@interface MYLinkModel : NSObject

@property (nonatomic, copy) NSString *linkText;  //链接内容
@property (nonatomic, strong) NSArray<UITextSelectionRect *> *rects; //矩形框数组
@property (nonatomic, assign) NSRange range;  //链接范围
@property (nonatomic, assign,getter=isTopicLink) MYLinkType linkType; //链接类型
@end
