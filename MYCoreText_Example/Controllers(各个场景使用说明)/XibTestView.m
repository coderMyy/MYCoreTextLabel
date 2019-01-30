//
//  XibTestView.m
//  MYCoreText_Example
//
//  Created by 孟遥 on 2019/1/30.
//  Copyright © 2019年 mengyao. All rights reserved.
//

#import "XibTestView.h"
#import "MYCoreTextLabel.h"


@interface XibTestView ()

@property (weak, nonatomic) IBOutlet MYCoreTextLabel *coreLabel;

@end

@implementation XibTestView

+(instancetype)loadXibView
{
    return [[NSBundle mainBundle]loadNibNamed:@"XibTestView" owner:nil options:nil].lastObject;
}
- (void)setContent:(NSString *)content
{
    _content = content;
    self.coreLabel.text = content;
    self.coreLabel.keywords = @[@"油伞"];
    self.coreLabel.customLinks = @[@"一杯相思",@"恍若昨"];
    [self.coreLabel renderForMaxWith:0 maxHeight:0];
}

@end
