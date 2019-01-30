//
//  XibViewController.m
//  MYCoreText_Example
//
//  Created by 孟遥 on 2019/1/30.
//  Copyright © 2019年 mengyao. All rights reserved.
//

#import "XibViewController.h"
#import "XibTestView.h"


@interface XibViewController ()

@property (nonatomic, strong) XibTestView *xView;

@end

@implementation XibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"xib使用示例";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.xView];
    self.xView.frame = CGRectMake(10,100,[UIScreen mainScreen].bounds.size.width-20,250);
    self.xView.content = @"这人间袅袅炊烟，和风花雪月浪漫。痴情人多半贪恋，爱恨情仇的好看。又让你痛不欲生，又让你趁醉装疯。终有天脱胎换骨，直到哭着笑才懂。欲问青天这人生有几何，怕这去日苦多。往事讨一杯相思喝，倘若这回还像曾经执着，心执念你一个，那我可能是多情了。浊酒一杯余生不悲不喜，何惧爱恨别离，一路纵马去斟酌，一曲相思入江水与山河，在油伞下走过，悠然入梦却恍若昨";
}

- (XibTestView *)xView
{
    if (!_xView) {
        _xView = [XibTestView loadXibView];
    }
    return _xView;
}


@end
