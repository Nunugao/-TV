//
//  ColumViewModel.h
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+ViewModel.h"
#import "TVNetManager.h"

typedef NS_ENUM(NSUInteger, RequestType) {
    RequestTypeRefresh,
    RequestTypeMore,
};

@interface ColumViewModel : NSObject

@property (nonatomic) NSMutableArray *columList;

- (ColumModel *) modelForRow:(NSInteger) row;

@property (nonatomic) NSInteger rowCount;


- (NSURL *) columImageURLForRow:(NSInteger) row;
- (NSString *) columNameForRow:(NSInteger) row;

@end
