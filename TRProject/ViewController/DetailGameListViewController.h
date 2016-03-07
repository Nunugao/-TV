//
//  DetailGameListViewController.h
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColumModel.h"

@interface DetailGameListViewController : UIViewController
//@property (nonatomic) NSString *slug;

@property (nonatomic) ColumModel *columModel;

@property (nonatomic) UINavigationController *navi;
@end
