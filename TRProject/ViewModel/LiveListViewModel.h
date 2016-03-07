//
//  LiveListViewModel.h
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LiveListModel.h"
#import "NSObject+ViewModel.h"
#import "LiveListNetManager.h"

@interface LiveListViewModel : NSObject

@property (nonatomic) NSMutableArray *liveList;

@property (nonatomic) NSInteger rowNumber;


- (LiveListDataModel *) modelForRow:(NSInteger) row;

- (NSURL *) thumbForRow:(NSInteger) row;
- (NSString *) titleForRow:(NSInteger) row;

- (NSString *)nickForRow:(NSInteger) row;
- (NSString *)viewForRow:(NSInteger) row;

- (NSString *)uidForRow:(NSInteger) row;

- (void)getDataWithRequestMode:(RequestMode)requestMode completionHanle:(void (^)(NSError *))completionHandle;

@end
