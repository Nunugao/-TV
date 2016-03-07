//
//  PlayModel.m
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PlayModel.h"

@implementation PlayModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [PlayDataModel class]};
}
@end


@implementation PlayRecommendModel

+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [PlayRecommendDataModel class]};
}

@end


@implementation PlayRecommendDataModel

+ (NSDictionary *)replaceKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


@implementation PlayRecommendLinkObjectDataModel

@end


@implementation PlayDataModel

@end


