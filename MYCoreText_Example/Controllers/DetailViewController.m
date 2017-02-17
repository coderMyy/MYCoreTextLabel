//
//  DetailViewController.m
//  复杂demo
//
//  Created by 孟遥 on 2017/2/14.
//  Copyright © 2017年 mengyao. All rights reserved.
//

#import "DetailViewController.h"
#import "MYCoreTextLabel.h"
#import "showCell.h"
#import "tableViewModel.h"

@interface DetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) MYCoreTextLabel *coretextLabel;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation DetailViewController

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 300;
        _tableView.allowsSelection = NO;
        [_tableView registerClass:[showCell class] forCellReuseIdentifier:@"showCell"];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.title = @"最复杂的情况,所有特性都展示";
    
    
    //测试数据
    for (NSInteger index = 0; index < 5; index ++) {
       
        tableViewModel *model = [[tableViewModel alloc]init];
        
        model.text =  @"大家好[龇牙], 写这个小小的#demo#起源是因为年前做项目[滑稽]，需要自己写即时通讯和朋友圈等功能，时间非常赶[噘嘴]，网上www.baidu.com和www.google.cn找了很久也没找到很合适的[白眼]可以用的代码，也还好第一期产品只需求表情文字混排，并没有做其他要求，于是直接用富文本就搞定了。不过联想到后面的需求，始终觉得是个隐患，既然找不到合适的代码就只有自己查资料，硬着头皮写一份了。。不过还好，断断续续上班之余，花了一周左右时间，给整理了出来，希望对需求的人有用.如果喜欢请点一下star噢 . 该#demo#已经运用到项目中，项目已经更新第二版了，如果有bug还请不吝赐教[害羞]。。[害羞]项目名称叫云语 。如果喜欢请点一下star噢[花心] . www.jyall.com [表情不存在的情况]";
        [self.dataArray addObject:model];
    }
    
    for (NSInteger index = 0; index < 5; index ++) {
        
        tableViewModel *model = [[tableViewModel alloc]init];
        
        model.text = @"我是测试数据[擦汗]我是测试数据[没有对应表情情况]我是测试数据我是测试数ww.我不是网址.com据我是测www.abc.com试数据我是测试数[我不存在]据我是测试数据我是[测试表情]测试数据我是测试数据我是测www.888.com试数据我[噘嘴]是测试数据我是测试[滑稽]数据我是测#试数据我#是测试数据我是@测试 测试数据我是测[调皮]试数据我是测试数据我是[没有对应表情情况]测试数据我是#测试数据我是#测试数据我#是测试#数据我是测试www.aaa.cn数据我是测试[测试]数据我是测试[擦汗]数据我是测试数据我是测试数据";
        [self.dataArray addObject:model];
    }
}


- (void)linkText:(NSString *)clickString type:(MYLinkType)linkType
{
    NSLog(@"----------%@--------%li",clickString,linkType);
}


#pragma mark - tableViewdelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    showCell *cell = [tableView dequeueReusableCellWithIdentifier:@"showCell"];
    
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableViewModel *model = self.dataArray[indexPath.row];
    return model.height;
}

@end
