//
//  ZYXTwoViewController.m
//  MasonryDemo1
//
//  Created by 公安信息 on 16/8/26.
//  Copyright © 2016年 zhangyanxiao. All rights reserved.
//

#import "ZYXTwoViewController.h"

@interface ZYXTwoViewController ()
@property (nonatomic, strong) UIView * yellowView;
@property (nonatomic, strong) UIView * greenView;
@property (nonatomic, strong) UIView * blueView;
@end

@implementation ZYXTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupViews];
}


- (void)p_setupViews
{
    /* equalTo后面的参数是id类型，所以这里需要将常量包装成对象，如果是数值，前面加@，比如@10，@50
    
    make.width.equalTo(@100);
    
    * mas_equalTo可以自动将后面的常量参数包装成对象 ，不需要@
    
    make.height.mas_equalTo(150);
    
    equalTo 和 mas_equalTo的区别在哪里呢? 其实 mas_equalTo是一个MACRO,比较的是值，equalTo比较的是view。
    */

    //实例1 黄色方块 size
    UIView * yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    self.yellowView = yellowView;
    
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(50);
        make.size.mas_equalTo(CGSizeMake(100, 100));

    }];
    //实例2 绿色方块 width。height
    UIView * greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    self.greenView = greenView;
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.right.equalTo(self.view).offset(-50);
        make.width.equalTo(self.yellowView); // mas_equalTo与equalTo区别仅仅在当参数是常量是，会被自动转换成对象类型；mas_equalTo只是对其参数进行了一个BOX操作(装箱)
        make.height.mas_equalTo(self.yellowView);
        
    }];
    
    //实例3 蓝色方块  -  与实例1比较mas_equalto 和equalTo的区别
    UIView * blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    self.blueView = blueView;
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(250);
        make.left.equalTo(self.view).offset(50);
        make.size.equalTo(self.yellowView).sizeOffset(CGSizeMake(20, 20));
    }];
    
    // 在使用Masonry时，有mas_left与mas_leading，同样有mas_right与mas_trailing，在中国都习惯左、右布局，使用left/right与heading/trailing是一样的。但是，在其它部分国家，开发者们的习惯不都是左、右或者前、后布局，还有右、左或者后、前布局的，因此是不一样的。
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
