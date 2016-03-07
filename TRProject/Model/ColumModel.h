//
//  ColumModel.h
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColumModel : NSObject

@property (nonatomic, copy) NSString *first_letter;

@property (nonatomic, assign) NSInteger prompt;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *name;

@end
