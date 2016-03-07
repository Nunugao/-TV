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

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //全局默认配置
    
    [self setupGlobalConfig];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [ViewController shareViewController].navi;
    [self.window makeKeyAndVisible];
//    
//    [LiveListNetManager getLiveListCompletionHandler:^(id model, NSError *error) {
//        NSLog(@"adfasdf");
//    }];

    return YES;
}

@end
