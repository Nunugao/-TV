//
//  TVNetManager.h
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TVPath.h"
#import "ColumModel.h"
#import "PlayModel.h"
@interface TVNetManager : NSObject

+ (id) getColumDataCompletionHandler:(void (^)(id model,NSError *error)) completionHandler;

@end
