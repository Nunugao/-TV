//
//  TVNetManager.m
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TVNetManager.h"

@implementation TVNetManager

+(id)getColumDataCompletionHandler:(void (^)(id, NSError *))completionHandler{
    return [NSObject GET:kColumPath parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([ColumModel parse:responseObj],error);
    }];
}

@end
