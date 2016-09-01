//
//  ZYXThreeViewController.m
//  MasonryDemo1
//
//  Created by 公安信息 on 16/8/26.
//  Copyright © 2016年 zhangyanxiao. All rights reserved.
//

#import "ZYXThreeViewController.h"

@interface ZYXThreeViewController ()

@property (nonatomic, strong) UIView * yellowView;
@property (nonatomic, strong) UIView * greenView;
@property (nonatomic, strong) UIView * blueView;
@property (nonatomic, strong) UIView * purpleView;
@property (nonatomic, strong) UIView * orangeView;
@property (nonatomic, strong) UIView * redView;

@end

@implementation ZYXThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self p_setupViews];
}


- (void)p_setupViews
{
    
    //实例1 黄色方块 size
    UIView * yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    self.yellowView = yellowView;
    
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.size.mas_equalTo(CGSizeMake(100, 100));
    
        make.centerX.mas_equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-150);
        
    }];
    //实例2 紫色方块 size
    UIView * purpleView = [[UIView alloc] init];
    purpleView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:purpleView];
    self.purpleView = purpleView;
    
    [purpleView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(100, 100));
        
        make.centerX.mas_equalTo(-150);
        make.centerY.equalTo(@(-250)); // 相对于父视图中心点的偏移量
        
    }];
    
    //实例3 绿色方块 size center
    UIView * greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    self.greenView = greenView;
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(100, 100));
        
        make.center.mas_equalTo(CGPointMake(0, 0));//这个地方需要注意：CGPointMake(0, 0)中数值指代是俯视图中心的偏移量
        
    }];
    //实例4 蓝色方块 size center
    UIView * blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    self.blueView = blueView;
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(100, 100));
        
        make.center.equalTo(self.greenView).centerOffset(CGPointMake(0, 200));//这个地方需要注意：CGPointMake(0, 0)中数值指代是俯视图中心的偏移量
        
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
