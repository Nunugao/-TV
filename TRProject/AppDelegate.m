//
//  AppDelegate.m
//  TRProject
//
//  Created by jiyingxin on 16/2/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+System.h"
#import "TVNetManager.h"
#import "ViewController.h"
#import "LiveListNetManager.h"
#import "PlayViewController.h"
#import "DetailGameListNetManager.h"
#import "IndexViewController.h"
#import "MyViewController.h"
#import "SearchViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //全局默认配置
    
    [self setupGlobalConfig];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController *tabVC = [[UITabBarController alloc]init];
    IndexViewController *index = [IndexViewController shareIndexViewController];
    [self addSearcItemOnVC:index];
    ViewController *category = [ViewController shareViewController];
    [self addSearcItemOnVC:category];
    PlayViewController *play = [PlayViewController sharePlayViewController];
    [self addSearcItemOnVC:play];
    MyViewController *my = [MyViewController shareMyViewController];
    [self addSearcItemOnVC:my];
    tabVC.viewControllers = @[index.navi,category.navi,play.navi,my.navi];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                       NSForegroundColorAttributeName:kRGBA(251, 51, 41, 1.0)
                                                       } forState:UIControlStateSelected];
    [[UITabBar appearance] setTranslucent:NO];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"player_top_control_bg.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.40280.000.00.@1x"]];
    [[UINavigationBar appearance] setBarTintColor:kRGBA(251, 51, 41, 1.0)];
    
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible];

    return YES;
}

- (void) addSearcItemOnVC:(UIViewController *)vc{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 45, 45);
    [button setImage:[UIImage imageNamed:@"搜索-默认@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.21025.000.00."] forState:UIControlStateNormal];
    [button bk_addEventHandler:^(id sender) {
        NSLog(@"test............");
        SearchViewController *searchVC = [SearchViewController new];
//        [[vc valueForKey:@"navi"] pushViewController:searchVC animated:YES];
        [vc.navigationController pushViewController:searchVC animated:YES];
    
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    UIBarButtonItem *speaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    speaceItem.width = -20;
    vc.navigationItem.rightBarButtonItems = @[speaceItem,searchItem];
}

@end
