//
//  ZYXOneViewController.m
//  MasonryDemo
//
//  Created by 公安信息 on 16/8/25.
//  Copyright © 2016年 zhangyanxiao. All rights reserved.
//

#import "ZYXOneViewController.h"

@interface ZYXOneViewController ()

@property (nonatomic, strong) UIView * yellowView;
@property (nonatomic, strong) UIView * greenView;
@property (nonatomic, strong) UIView * blueView;
@property (nonatomic, strong) UIView * purpleView;
@property (nonatomic, strong) UIView * orangeView;
@property (nonatomic, strong) UIView * redView;


@end

@implementation ZYXOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self p_setupViews];
}

- (void)p_setupViews
{
    __weak typeof(self) weakSelf = self;

    UIView * yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    self.yellowView = yellowView;
    /*
     * yellowView边距相对于父视图(100, 30, 30, 30)
     * mas_makeConstraints:这个方法中谁调用该方法，谁就是make
     * equalTo后面的参数是id类型，所以这里需要将常量包装成对象，如果是数值，前面加@，比如@10，@50 
     
make.width.equalTo(@100);
     
     * mas_equalTo可以自动将后面的常量参数包装成对象 ，不需要@
     
make.height.mas_equalTo(150);
     
     equalTo 和 mas_equalTo的区别在哪里呢? 其实 mas_equalTo是一个MACRO,比较的是值，equalTo比较的是view。
     
     * 词句解释make.edges.mas_equalTo(UIEdgeInsetsMake(100, 30, 30, 30));     * yellowView上、左、下、右到父视图的距离 等于 值UIEdgeInsetsMake(100, 30, 30, 30)

     */
    
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(100, 30, 30, 30));
    }];
    UIView * greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [yellowView addSubview:greenView];
    self.greenView = greenView;
    /*
     * greenView边距相对于父视图(30, 30, 30, 30)
     * mas_makeConstraints:这个方法中谁调用该方法，谁就是make
     * 词句解释
  make.top.equalTo(weakSelf.yellowView.mas_top).multipliedBy(1.0).with.offset(30);

     * 用文字描述：greenView上边 = 父控件 * 常数a + 常量b（实际上因为是乘以1倍，可以省略multipliedBy(1.0)）
     * with 是为了便于理解和阅读，也没有实际意义，同样可以省略。
     * weakSelf.yellowView后面的参数mas_top也可以省略，因为系统会默认父控件后边的参数和make的参数是对应的。
     
     */
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.yellowView.mas_top).multipliedBy(1.0).with.offset(30);
        make.left.equalTo(weakSelf.yellowView.mas_left).multipliedBy(1.0).with.offset(30);
        make.bottom.equalTo(weakSelf.yellowView.mas_bottom).multipliedBy(1.0).with.offset(-30);
        make.right.equalTo(weakSelf.yellowView.mas_right).multipliedBy(1.0).with.offset(-30);
    }];

    UIView * blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.greenView addSubview:blueView];
    self.blueView = blueView;
    /*
     * blueView边距相对于父视图(300, 30, 30, 30)
     * 经过三次省略，我们可以写成下面这样
     make.top.equalTo(weakSelf.yellowView).offset(30);

     * 实际上，还可以继续省略，系统会默认make是相对于父控件而言的，我们可以将.equalTo(weakSelf.greenView)也省略掉。
     
     */
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.greenView).offset(30);
        make.left.equalTo(weakSelf.greenView).offset(30);
        make.bottom.equalTo(weakSelf.greenView).offset(-30);
        make.right.equalTo(weakSelf.greenView).offset(-30);
    }];

    UIView * purpleView = [[UIView alloc] init];
    purpleView.backgroundColor = [UIColor purpleColor];
    [self.blueView addSubview:purpleView];
    self.purpleView = purpleView;
    /*
     * purpleView边距相对于父视图(300, 30, 30, 30)
     * 经过三次省略，我们可以写成下面这样
     make.top.mas_equalTo(30);
     make.left.mas_equalTo(30);
     make.bottom.mas_equalTo(-30);
     make.right.mas_equalTo(-30);
     * 我们可以在这个基础上进行合并成
     make.left.top.offset(30);
     make.bottom.right.offset(-30);
     
     */
    [purpleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.left.mas_equalTo(30);
        make.bottom.mas_equalTo(-30);
        make.right.mas_equalTo(-30);
    }];
    
//    UIView * redView = [[UIView alloc] init];
//    redView.backgroundColor = [UIColor redColor];
//    [yellowView addSubview:redView];
//    /*
//     * redView边距相对于父视图(300, 30, 30, 30)
//     * mas_makeConstraints:这个方法中谁调用该方法，谁就是make
//     * 词句解释
//         make.top.mas_equalTo(30);
//         make.left.mas_equalTo(30);
//         make.bottom.mas_equalTo(-30);
//         make.right.mas_equalTo(-30);
//     * redView上边 等于 值UIEdgeInsetsMake(100, 30, 30, 30)
//     
//     */
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(30);
//        make.left.mas_equalTo(30);
//        make.bottom.mas_equalTo(-30);
//        make.right.mas_equalTo(-30);
//    }];

    
    
    
    
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
