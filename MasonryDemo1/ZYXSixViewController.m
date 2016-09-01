//
//  ZYXSixViewController.m
//  MasonryDemo1
//
//  Created by 公安信息 on 16/8/30.
//  Copyright © 2016年 zhangyanxiao. All rights reserved.
//

#import "ZYXSixViewController.h"

@interface ZYXSixViewController ()

@property (nonatomic, strong) UIButton * yellowButton;
@property (nonatomic, assign) BOOL buttonClicked;

@end

@implementation ZYXSixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupViews];
}


- (void)p_setupViews
{
    self.buttonClicked = NO;
    //实例1
    UIButton * yellowButton = [UIButton buttonWithType:UIButtonTypeCustom];
    yellowButton.backgroundColor = [UIColor yellowColor];
    [yellowButton setTitle:@"点击尺寸改变" forState:UIControlStateNormal];
    [yellowButton setTitleColor:[UIColor blackColor] forState:
     UIControlStateNormal];
    yellowButton.layer.cornerRadius = 5;
    [self.view addSubview:yellowButton];
    self.yellowButton = yellowButton;
    [yellowButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.center.equalTo(self.view);
    }];
    [yellowButton addTarget:self action:@selector(yellowButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)yellowButtonClicked:(UIButton *)sender{
    
    self.buttonClicked = !self.buttonClicked;

    // 告诉self.view约束需要更新
    [self.view setNeedsUpdateConstraints];
    
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    }];
    
    
}


- (void)updateViewConstraints
{
    // 这里使用update也是一样的。
    // remake会将之前的全部移除，然后重新添加
    __weak __typeof(self) weakSelf = self;
    [self.yellowButton mas_remakeConstraints:^(MASConstraintMaker *make) {

        if (weakSelf.buttonClicked) {
            make.top.bottom.mas_equalTo(0);
            make.left.right.mas_equalTo(0);
        }else{
            make.size.mas_equalTo(CGSizeMake(100, 100));
            make.center.equalTo(self.view);
        }
        
    }];
    [super updateViewConstraints];


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
