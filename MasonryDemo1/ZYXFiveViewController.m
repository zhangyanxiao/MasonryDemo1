//
//  ZYXFiveViewController.m
//  MasonryDemo1
//
//  Created by 公安信息 on 16/8/29.
//  Copyright © 2016年 zhangyanxiao. All rights reserved.
//

#import "ZYXFiveViewController.h"

@interface ZYXFiveViewController ()

@property (nonatomic, strong) UIButton * yellowButton;
@property (nonatomic, assign) BOOL buttonClicked;

@property (nonatomic, strong) UIButton * blueButton;
@property (nonatomic, assign) CGFloat scacle;

@end

@implementation ZYXFiveViewController

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
    
    
    self.scacle = 1.0;
    //实例2
    UIButton * blueButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [blueButton setTitle:@"点击尺寸改变" forState:UIControlStateNormal];
    [blueButton setTitleColor:[UIColor blackColor] forState:
     UIControlStateNormal];
     blueButton.layer.cornerRadius = 5;
     blueButton.layer.borderColor = UIColor.blueColor.CGColor;
     blueButton.layer.borderWidth = 3;
    [self.view addSubview:blueButton];
    self.blueButton = blueButton;
    // 此处也可以用mas_updateConstraints
    // 有些情况是在变化过程中约束有了冲突，这样我们可以通过设置优先级的高低来决定使用哪个
    
    [self.blueButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(100 * self.scacle).priorityLow();
        make.center.equalTo(self.view).centerOffset(CGPointMake(0, -200));
        make.width.height.lessThanOrEqualTo(self.view);

        
    }];
    [blueButton addTarget:self action:@selector(blueButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)yellowButtonClicked:(UIButton *)sender{
    
    if (self.buttonClicked == NO) {
        self.buttonClicked = YES;
        [self.yellowButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(200, 100));;
            make.center.equalTo(self.view);
        }];

    }else{
        self.buttonClicked = NO;
        [self.yellowButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 100));
            make.center.equalTo(self.view);
        }];

    }


}

- (void)blueButtonClicked:(UIButton *)sender{
    self.scacle+= 0.5;
    
    //使用动画，要加这个
    // 告知需要更新约束，但是不会立刻开始
    [self.view setNeedsUpdateConstraints];
    // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:1 animations:^{
         // 告知页面布局立刻更新
        [self.view layoutIfNeeded];
    }];
    
    
    
}

- (void)updateViewConstraints
{
    [self.blueButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(100 * self.scacle).priorityLow();
        make.center.equalTo(self.view).centerOffset(CGPointMake(0, -200)).priorityLow();
        make.width.height.lessThanOrEqualTo(self.view);
        
    }];
    [super updateViewConstraints];
    NSLog(@"%f",CGRectGetMaxY(self.blueButton.frame));
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
