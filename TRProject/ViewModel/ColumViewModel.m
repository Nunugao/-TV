//
//  ColumViewModel.m
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ColumViewModel.h"

@implementation ColumViewModel

-(NSInteger)rowCount{
    return self.columList.count;
}


- (ColumModel *)modelForRow:(NSInteger)row{
    return self.columList[row];
}

- (NSString *)columNameForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}

- (NSURL *)columImageURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].image];
}

- (void)getDataWithRequestMode:(RequestMode)requestMode completionHanle:(void (^)(NSError *))completionHandle{
        [TVNetManager getColumDataCompletionHandler:^(NSArray *model, NSError *error) {
            [self.columList addObjectsFromArray:model];
            completionHandle(error);
        }];
}

#pragma mark - 懒加载
- (NSMutableArray *)columList {
    if(_columList == nil) {
        _columList = [[NSMutableArray alloc] init];
    }
    return _columList;
}
@end
