//
//  LiveListNetManager.h
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LiveListNetManager : NSObject
+ (id) getLiveListCompletionHandler:(void (^)(id model,NSError *error)) completionHandler;
@end
