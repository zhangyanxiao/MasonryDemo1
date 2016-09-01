//
//  ZYXBaseViewController.m
//  MasonryDemo
//
//  Created by 公安信息 on 16/8/25.
//  Copyright © 2016年 zhangyanxiao. All rights reserved.
//

#import "ZYXBaseViewController.h"

@interface ZYXBaseViewController ()

@end

@implementation ZYXBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:129/255.0 blue:129/255.0 alpha:1];
    if (kIOSVersion >= 7.0) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        /*
         edgesForExtendedLayout是一个类型为UIExtendedEdge的属性，指定边缘要延伸的方向。
         
         因为iOS7鼓励全屏布局，它的默认值很自然地是UIRectEdgeAll，四周边缘均延伸，就是说，如果即使视图中上有navigationBar，下有tabBar，那么视图仍会延伸覆盖到四周的区域。
         
         self.edgesForExtendedLayout = UIRectEdgeNone;
         来解决UINavigationBar透明的问题。设置了UIRectEdgeNone之后，你嵌在UIViewController里面的UITableView和UIScrollView就不会穿过UINavigationBar了，同时UIView的控件也回复到了iOS6时代。
         masonry中同样适用。
         
         */
        //如果设置成 self.edgesForExtendedLayout = UIRectEdgeBottom;那么就会self.view.frame是从navigationBar下面开始计算一直到屏幕底部；
        //如果设置成 self.edgesForExtendedLayout = UIRectEdgeNone;那么就会self.view.frame是从navigationBar下面开始计算一直到屏幕tabBar上部；
        //如果设置成 self.edgesForExtendedLayout = UIRectEdgeTop;那么就会self.view.frame是从navigationBar上面计算面开始计算一直到屏幕tabBar上部；
        
        //iOS7以上系统，self.navigationController.navigationBar.translucent默认为YES，self.view.frame.origin.y从0开始（屏幕最上部）。
        //此时若是添加代码self.edgesForExtendedLayout = UIRectEdgeNone（iOS7.0以后方法）;self.view.frame.origin.y会下移64像素至navBar下方开始。
    }
    


}

- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super init]) {
        self.title = title;
        
    }
    
    return self;
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
