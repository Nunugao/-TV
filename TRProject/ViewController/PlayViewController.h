//
//  PlayViewController.h
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayViewController : UIViewController
@property (nonatomic) UINavigationController *navi;

+ (PlayViewController *) sharePlayViewController;
@end
