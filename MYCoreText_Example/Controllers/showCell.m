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
        MYAttributeModel *model = [[MYAttributeModel alloc]init];
        model.textFont = [UIFont systemFontOfSize:15.f];
        model.textColor = [UIColor brownColor];
        model.norLinkFont = [UIFont systemFontOfSize:18.f];
        model.norLinkColor = [UIColor blueColor];
        model.norLinkBackColor = [UIColor redColor];
        model.customLinkFont = [UIFont systemFontOfSize:18.f];
        model.customLinkColor = [UIColor grayColor];
        model.customLinkBackColor = [UIColor orangeColor];
        model.keyWord = @"如果喜欢请点一下star噢";
        model.keyWordColor = [UIColor redColor];
        model.keyWordBackColor = [UIColor blueColor];
        model.shouldShowNormLink = YES;
        _coretextLabel.attribute = model;
        _coretextLabel.delegate = self; 
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
    [self.coretextLabel text:model.text customLinks:@[@"大家好"]];
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
