//
//  ZYXFourViewController.m
//  MasonryDemo1
//
//  Created by 公安信息 on 16/8/29.
//  Copyright © 2016年 zhangyanxiao. All rights reserved.
//

#import "ZYXFourViewController.h"

@interface ZYXFourViewController ()

@property (nonatomic, strong) UIView * yellowView;
@property (nonatomic, strong) UIView * greenView;
@property (nonatomic, strong) UIView * blueView;
@property (nonatomic, strong) UIView * purpleView;
@property (nonatomic, strong) UIView * orangeView;
@property (nonatomic, strong) UIView * redView;

@end

@implementation ZYXFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self p_setupViews];
}


- (void)p_setupViews
{
    
    //实例1
    UIView * yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
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
    

    //item宽度确定。自适应间距
    [@[yellowView, greenView, blueView] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                                                 withFixedItemLength:100
                                                         leadSpacing:15
                                                         tailSpacing:15];
    //多个view设置相同属性值
    [@[yellowView, greenView, blueView] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.height.mas_equalTo(50);
        //        make.size.mas_equalTo(CGSizeMake(100, 100));
        
    }];
    
    //实例2
    UIView * purpleView = [[UIView alloc] init];
    purpleView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:purpleView];
    self.purpleView = purpleView;
    
    UIView * orangeView = [[UIView alloc] init];
    orangeView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:orangeView];
    self.orangeView = orangeView;
    
    UIView * redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    self.redView = redView;
    
    
    //间距确定，自适应宽度
    [@[purpleView, orangeView, redView] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                                                    withFixedSpacing:50 leadSpacing:15 tailSpacing:15];
    //多个view设置相同属性值
    [@[purpleView, orangeView, redView] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.yellowView.mas_bottom).offset(50);
        make.height.mas_equalTo(50);
        //        make.size.mas_equalTo(CGSizeMake(100, 100));
        
    }];
    
    //
    
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
