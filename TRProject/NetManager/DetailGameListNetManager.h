//
//  DetailGameListNetManager.h
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TVPath.h"
#import "LiveListModel.h"

@interface DetailGameListNetManager : NSObject

+ (id) getDetailGameListWithSlug:(NSString *) slug withPage:(NSInteger)page completionHandler:(void (^)(id model,NSError *error)) completionHandler;

@end
