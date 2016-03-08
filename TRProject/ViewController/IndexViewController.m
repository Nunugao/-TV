//
//  AViewController.m
//  TRProject
//
//  Created by tarena on 16/3/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "IndexViewController.h"

@interface IndexViewController ()

@end

@implementation IndexViewController

+ (IndexViewController *)shareIndexViewController{
    static IndexViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [self new];
        vc.navi = [[UINavigationController alloc]initWithRootViewController:vc];
        vc.title = @"首页";
        vc.navigationController.navigationBar.tintColor = [UIColor orangeColor];
        vc.navigationController.navigationBar.translucent = NO;
        vc.tabBarItem.image = [[UIImage imageNamed:@"推荐-默认.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.54283.000.00.@1x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:@"推荐-焦点@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.19656.000.00."] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    });
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
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
