//
//  XibTestView.h
//  MYCoreText_Example
//
//  Created by 孟遥 on 2019/1/30.
//  Copyright © 2019年 mengyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XibTestView : UIView
+(instancetype)loadXibView;
@property (nonatomic, copy) NSString *content;
@end
