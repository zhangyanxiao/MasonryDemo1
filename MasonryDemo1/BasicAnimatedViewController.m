//
//  BasicAnimatedViewController.m
//  MasonryDemo1
//
//  Created by 公安信息 on 16/8/31.
//  Copyright © 2016年 zhangyanxiao. All rights reserved.
//

#import "BasicAnimatedViewController.h"

@interface BasicAnimatedViewController ()

@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, assign) CGFloat padding;

@end

@implementation BasicAnimatedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupViews];
}


- (void)p_setupViews
{
        UIView * greenView = [[UIView alloc] init];
        greenView.backgroundColor = [UIColor greenColor];
        greenView.layer.borderColor = [UIColor blackColor].CGColor;
        greenView.layer.borderWidth = 2;
        [self.view addSubview:greenView];
        self.greenView = greenView;
    
        UIView * redView = [[UIView alloc] init];
        redView.backgroundColor = [UIColor redColor];
        redView.layer.borderColor = [UIColor blackColor].CGColor;
        redView.layer.borderWidth = 2;
        [self.view addSubview:redView];
        self.redView = redView;
    
        UIView * blueView = [[UIView alloc] init];
        blueView.backgroundColor = [UIColor blueColor];
        blueView.layer.borderColor = [UIColor blueColor].CGColor;
        blueView.layer.borderWidth = 2;
        [self.view addSubview:blueView];
        self.blueView = blueView;
    
    
    
        //设置三个控件等高
        self.padding = 10;
    
        CGFloat padding = self.padding;

    //在这三个控件中，相等关系用的比较多，也是需要理解的地方
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(padding);
        make.left.mas_equalTo(padding);
        make.right.mas_equalTo(redView.mas_left).offset(-padding);
        make.bottom.mas_equalTo(blueView.mas_top).offset(-padding);
        //三个控件等高
        make.height.mas_equalTo(@[redView, blueView]);
        // redView greenView等宽
        make.width.mas_equalTo(redView);
        make.width.lessThanOrEqualTo(self.view);
        
    }];
//    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(padding),
//        make.left.mas_equalTo(padding),
//        make.right.mas_equalTo(redView.mas_left).offset(-padding),
//        make.bottom.mas_equalTo(blueView.mas_top).offset(-padding).priorityLow(),
//        // 三个控件等高
////        make.height.mas_equalTo(@[redView, blueView]);
//        // 红、绿这两个控件等高
//        make.width.mas_equalTo(redView);
//        make.height.lessThanOrEqualTo(self.view);
//    }];

    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.width.bottom.mas_equalTo(greenView);
        make.right.mas_equalTo(-padding);
        make.left.mas_equalTo(greenView.mas_right).offset(padding);
        make.height.mas_equalTo(@[greenView, blueView]);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@[greenView, redView]);
        make.bottom.mas_equalTo(-padding);
        make.left.mas_equalTo(padding);
        make.right.mas_equalTo(-padding);
    }];
    
    [self updateAnimated:NO];



//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.height.width.bottom.equalTo(greenView);
//        make.right.mas_equalTo(-padding);
//        make.left.mas_equalTo(greenView.mas_right).offset(padding);
//        make.height.mas_equalTo(@[greenView, blueView]);
//    }];
//    
//    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(@[greenView, redView]);
//        make.bottom.mas_equalTo(-padding);
//        make.left.mas_equalTo(padding);
//        make.right.mas_equalTo(-padding);
//    }];
//    
//    //调用，进行动画效果展示
//    [self updateAnimated:NO];
    
}
- (void)updateAnimated:(BOOL)animated {
    CGFloat padding = self.padding >= 350 ? 10 : 350;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    [self.blueView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-padding);
        make.top.mas_equalTo((screenHeight - 64) / 2 - 5);
        //    make.right.mas_equalTo(self.view.mas_right).offset(-padding);
    }];
    
    if (animated) {
        [self.view setNeedsUpdateConstraints];
        [self.view updateConstraintsIfNeeded];
        
        [UIView animateWithDuration:0.5 animations:^{
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            self.padding = padding;
            [self updateAnimated:YES];
        }];
    } else {
        [self.view layoutIfNeeded];
        
        [self updateAnimated:YES];
    }
}
//- (void)updateAnimated:(BOOL)animated {
//    //使用条件表达式对padding值进行判断，并对其重新赋值
//    CGFloat padding = self.padding >= 350 ? 10 : 350;
//    
//    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
//    
//    [self.blueView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(-padding);
//        make.top.mas_equalTo((screenHeight -64) / 2 - 5);
//    }];
//    
//    if (animated) {
//        // 告知需要更新约束，但是不会立刻开始
//        [self.view setNeedsUpdateConstraints];
//        // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
//        [self.view updateConstraintsIfNeeded];
//        [UIView animateWithDuration:1 animations:^{
//            
//            [self.view layoutIfNeeded];
//            
//        } completion:^(BOOL finished) {
//            // 告知页面布局立刻更新
//            [self updateAnimated:YES];
//            
//        }];
//    }else{
//        // 告知页面布局立刻更新
//        [self.view layoutIfNeeded];
//        [self updateAnimated:YES];
//    }
//
//    
//}
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
