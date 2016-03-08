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

+ (id)getLiveListWithPage:(NSInteger)page CompletionHandler:(void (^)(id, NSError *))completionHandler{
    
    NSString *path = nil;
    if (page == 0) {
        path = [NSString stringWithFormat:kPlayPath,@""];
    }else{
        NSString *tempPath = [NSString stringWithFormat:@"_%lu",page];
        path = [NSString stringWithFormat:kPlayPath,tempPath];
    }
    NSLog(@"path:%@",path);
    return [NSObject GET:path parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([LiveListModel parse:responseObj],error);
    }];
}

@end
