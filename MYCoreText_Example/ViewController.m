//
//  ViewController.m
//  MYCoreText_Example
//
//  Created by 孟遥 on 2017/2/17.
//  Copyright © 2017年 mengyao. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"
#import "LinksViewController.h"
#import "KeywordViewController.h"
#import "DetailViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *munesArray;

@end

@implementation ViewController

- (NSArray *)munesArray
{
    if (!_munesArray) {
        _munesArray = @[@"只展示图片/表情,其他链接不展示",@"只展示链接,其他不展示",@"只展示关键字,其他不展示",@"最复杂的情况,所有特性都展示"];
    }
    return _munesArray;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 80;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"使用场景列表";
    [self.view addSubview:self.tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.munesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    cell.textLabel.text = self.munesArray[indexPath.row];
    cell.textLabel.textColor = [UIColor redColor];
    cell.textLabel.font = [UIFont systemFontOfSize:18.f weight:1];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            ImageViewController *imageVc = [[ImageViewController alloc]init];
            [self.navigationController pushViewController:imageVc animated:YES];
        }
            break;
        case 1:
        {
            LinksViewController *imageVc = [[LinksViewController alloc]init];
            [self.navigationController pushViewController:imageVc animated:YES];
        }
            break;
            
        case 2:
        {
            KeywordViewController *imageVc = [[KeywordViewController alloc]init];
            [self.navigationController pushViewController:imageVc animated:YES];
        }
            break;
            
        case 3:
        {
            DetailViewController *imageVc = [[DetailViewController alloc]init];
            [self.navigationController pushViewController:imageVc animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
