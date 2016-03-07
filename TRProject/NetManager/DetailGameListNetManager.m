//
//  DetailGameListNetManager.m
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailGameListNetManager.h"

@implementation DetailGameListNetManager

+(id)getDetailGameListWithSlug:(NSString *)slug completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kGameList,slug];
    NSLog(@"path:%@",path);
    return [NSObject GET:path parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([LiveListModel parse:responseObj],error);
    }];
}

@end
