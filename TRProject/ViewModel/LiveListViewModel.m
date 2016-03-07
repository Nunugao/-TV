//
//  LiveListViewModel.m
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LiveListViewModel.h"

@implementation LiveListViewModel


-(NSInteger)rowNumber{
    return self.liveList.count;
}
//- (LiveListDataModel *) modelForRow:(NSInteger) row;
//
//- (NSURL *) thumbForRow:(NSInteger) row;
//- (NSString *) titleForRow:(NSInteger) row;
//
//- (NSString *)nickForRow:(NSInteger) row;
//- (NSString *)viewForRow:(NSInteger) row;
//
//- (NSString *)uidForRow:(NSInteger) row;

- (LiveListDataModel *)modelForRow:(NSInteger)row{
    return  self.liveList[row];
}

- (NSURL *)thumbForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].thumb];
}

-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}

- (NSString *)nickForRow:(NSInteger)row{
    return [self modelForRow:row].nick;
}

-(NSString *)viewForRow:(NSInteger)row{
    NSInteger number = [self modelForRow:row].view.integerValue;
    if (number  > 10000) {
        return [NSString stringWithFormat:@"%.1f万",number/10000.0];
    }else{
        return [NSString stringWithFormat:@"%ld",(long)number];
    }
}

- (NSString *)uidForRow:(NSInteger)row{
    return [self modelForRow:row].uid;
}

- (void)getDataWithRequestMode:(RequestMode)requestMode completionHanle:(void (^)(NSError *error))completionHandle{
//    switch (requestMode) {
//        case RequestModeRefresh: {
//            
//            break;
//        }
//        case RequestModeMore: {
//            
//            break;
//        }
//    }
    [LiveListNetManager getLiveListCompletionHandler:^(LiveListModel *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.liveList removeAllObjects];
            }
            [self.liveList addObjectsFromArray:model.data];
        }
        completionHandle(error);
    }];
}

#pragma mark - 懒加载
- (NSMutableArray *)liveList {
    if(_liveList == nil) {
        _liveList = [[NSMutableArray alloc] init];
    }
    return _liveList;
}
@end
