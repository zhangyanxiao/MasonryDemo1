//
//  ZYXEightViewController.m
//  MasonryDemo1
//
//  Created by 公安信息 on 16/8/31.
//  Copyright © 2016年 zhangyanxiao. All rights reserved.
//

#import "ZYXEightViewController.h"

@interface ZYXEightViewController ()

@property (nonatomic, strong) UIView * yellowView;
@property (nonatomic, strong) UIView * greenView;
@property (nonatomic, strong) UIView * blueView;
@property (nonatomic, strong) UIView * purpleView;
@property (nonatomic, strong) UIView * orangeView;
@property (nonatomic, strong) UIView * redView;

@end

@implementation ZYXEightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupViews];
}


- (void)p_setupViews
{
    
    //实例1 黄色方块 size
    UIView * yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
//    yellowView.layer.borderWidth = 2;
//    yellowView.layer.borderColor = UIColor.blackColor.CGColor;
    [self.view addSubview:yellowView];
    self.yellowView = yellowView;
    
    UIView * greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    self.greenView = greenView;
    
    UIView * blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    self.blueView = blueView;
    
    UIView * purpleView = [[UIView alloc] init];
    purpleView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:purpleView];
    self.purpleView = purpleView;
    
    //外层
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(blueView);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.bottom.mas_equalTo(-10);
        make.top.mas_equalTo(yellowView.mas_bottom).offset(10);
    }];
    
    //里层
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.yellowView);
        make.left.right.mas_equalTo(self.yellowView);
        make.height.mas_equalTo(self.yellowView).dividedBy(3);
    }];
    
    __weak __typeof(self) weakSelf = self;

    [purpleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(blueView);
        make.left.mas_equalTo(100);//这个地方很不明白为什么不可以写purpleView.mas_width
        make.height.mas_equalTo(purpleView.mas_width).multipliedBy(3);
        make.width.height.left.mas_equalTo(blueView).priorityLow();
        make.width.height.lessThanOrEqualTo(blueView);
            }];
    
    

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
