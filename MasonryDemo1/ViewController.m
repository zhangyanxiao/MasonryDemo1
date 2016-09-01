//
//  ViewController.m
//  MasonryDemo
//
//  Created by 公安信息 on 16/8/25.
//  Copyright © 2016年 zhangyanxiao. All rights reserved.
//

#import "ViewController.h"
#import "ZYXOneViewController.h"
#import "ZYXTwoViewController.h"
#import "ZYXThreeViewController.h"
#import "ZYXFourViewController.h"
#import "ZYXFiveViewController.h"
#import "ZYXSixViewController.h"
#import "ZYXSevenViewController.h"
#import "ZYXEightViewController.h"
#import "BasicAnimatedViewController.h"
#import "ScrollViewController.h"
#import "ScrollViewComplexController.h"
#import "TableViewController.h"
#import "HeaderFooterViewController.h"


static NSString * cellID = @"tableViewCell";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, strong) NSArray * controllers;

@end

@implementation ViewController

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UITableView * tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    self.tableView = tableView;
    tableView.backgroundColor = [UIColor lightGrayColor];
    __weak typeof(self) weakSelf = self;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.edges.equalTo(weakSelf.view);
    }];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
//    self.dataArray = @[@"你好测试号",@"哗啦啦",@"三月三"];
    self.controllers = @[
                         [[ZYXOneViewController alloc] initWithTitle:@"一、属性 edges top left bottom right offset"],
                         [[ZYXTwoViewController alloc] initWithTitle:@"二、属性size width height偏移sizeOffset"],
                         [[ZYXThreeViewController alloc] initWithTitle:@"三、属性centerX centerY center 偏移centerOffset"],
                         [[ZYXFourViewController alloc] initWithTitle:@"四、约束方法2个mas_distributeViews。。。"],
                         [[ZYXFiveViewController alloc] initWithTitle:@"五、约束方法—更新mas_updateConstraints及优先级priorityLow()"],
                         [[ZYXSixViewController alloc] initWithTitle:@"六、约束方法—重新设置mas_remakeConstraints"],
                         [[ZYXSevenViewController alloc] initWithTitle:@"七、关系计算—lessThanOrEqualTo等并使用手势"],
                         [[ZYXEightViewController alloc] initWithTitle:@"八、宽高比例multipliedBy() dividedBy()"],
                         [[BasicAnimatedViewController alloc] initWithTitle:@"基本动画"],
                         [[ScrollViewController alloc] initWithTitle:@"ScrollView布局"],
                         [[ScrollViewComplexController alloc] initWithTitle:@"复杂ScrollView"],
                         [[TableViewController alloc] initWithTitle:@"tableview布局"],
                         [[HeaderFooterViewController alloc] initWithTitle:@"header/footer layout"],
                         
                         ];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.controllers.count;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
//    cell.textLabel.text = self.dataArray[indexPath.row];
    UIViewController * vc = self.controllers[indexPath.row];
    cell.textLabel.text = vc.title;
    
    cell.backgroundColor = [UIColor colorWithRed:239/255.0 green:61/255.0 blue:71/255.0 alpha:1];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    UIViewController * vc = self.controllers[indexPath.row];

    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
