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
        
        model.text =  @"大家好[呲牙], 写这个小小的#demo#起源是因为年前做项目[滑稽]，需要自己写即时通讯和朋友圈等功能，时间非常赶[噘嘴]，网上www.baidu.com和www.google.cn找了很久也没找到很合适的[白眼]可以用的代码，即使找到一些图文混排的也都有Bug或者并不完善 . [噘嘴]在空闲时间花了大概一周写了一份 , 一直不断的完善性能和修复bug , 目前为止基本上已经非常稳定了 ,项目里运用迭代也超过了5个版本 . 此外 , 还有一些很多同僚提出的意见 ,如果支持手机号和邮箱号的匹配 , 针对这些再次对该label做了相应的结构调整 [害羞]. 目前支持图片表情文字混排比如[白眼][擦汗][呲牙], 网址链接比如www.google.cn ,话题比如#这是一个话题#,at比如@孟遥,手机号比如13912345678,邮箱号比如我的邮箱mengyao_block@outlook.com,有意见可以提出 .自己设定的文字比如这是一个自定义链接,这是另外一个自定义链接,关键字比如我是一个关键字. 也可根据文本的range进行设定链接.[卖萌] . 如果觉得有用麻烦star一下或者fork一下喔...";
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
    NSLog(@"----------点击内容是 : %@--------链接类型是 : %li",clickString,linkType);
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
