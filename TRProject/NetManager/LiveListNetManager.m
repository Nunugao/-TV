//
//  LiveListNetManager.m
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LiveListNetManager.h"
#import "TVPath.h"
#import "LiveListModel.h"

@implementation LiveListNetManager

+ (id)getLiveListCompletionHandler:(void (^)(id, NSError *))completionHandler{
    return [NSObject GET:kPlayPath parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([LiveListModel parse:responseObj],error);
    }];
}

@end
