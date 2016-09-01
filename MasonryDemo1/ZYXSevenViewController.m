//
//  ZYXSevenViewController.m
//  MasonryDemo1
//
//  Created by 公安信息 on 16/8/30.
//  Copyright © 2016年 zhangyanxiao. All rights reserved.
//

#import "ZYXSevenViewController.h"

@interface ZYXSevenViewController ()

@property (nonatomic, strong) UIView * yellowView;
@property (nonatomic, strong) UIView * purpleView;


@property (nonatomic, assign) BOOL isExpaned;

@end

@implementation ZYXSevenViewController

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
    yellowView.layer.borderWidth = 2;
    yellowView.layer.borderColor = UIColor.blackColor.CGColor;
    [self.view addSubview:yellowView];
    self.yellowView = yellowView;
    //添加手势点击事件
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(yellowViewTap)];
    [yellowView addGestureRecognizer:tap];
    

    //实例2 紫色方块 size
    UIView * purpleView = [[UIView alloc] init];
    purpleView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:purpleView];
    self.purpleView = purpleView;
    
    [self updateWithThreeViewWithExpand:NO WithAnimated:NO];
    


}

- (void)yellowViewTap{
    [self updateWithThreeViewWithExpand:!self.isExpaned WithAnimated:YES];
}

- (void)updateWithThreeViewWithExpand:(BOOL)isExpanded WithAnimated:(BOOL)animated{
    
    self.isExpaned = isExpanded;
    
    [self.yellowView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(84);
        make.right.mas_equalTo(-20);
        if (isExpanded) {
            make.bottom.mas_equalTo(-20);
        } else {
            make.bottom.mas_equalTo(-300);
        }
    }];
    
    [self.purpleView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.yellowView);
        
        // 这里使用优先级处理
        // 设置其最大值为250，最小值为90
        if (!isExpanded) {
            make.width.height.mas_equalTo(100 * 0.5).priorityLow();
        } else {
            make.width.height.mas_equalTo(100 * 3).priorityLow();
        }
        
        // 最大值为250
        make.width.height.lessThanOrEqualTo(@250);
        
        // 最小值为90
        make.width.height.greaterThanOrEqualTo(@90);
    }];
    
    if (animated) {
        [self.view setNeedsUpdateConstraints];
        [self.view updateConstraintsIfNeeded];
        
        [UIView animateWithDuration:0.5 animations:^{
            [self.view layoutIfNeeded];
        }];
    }

    
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
