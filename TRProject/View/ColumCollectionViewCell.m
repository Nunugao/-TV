//
//  ColumCollectionViewCell.m
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ColumCollectionViewCell.h"

@implementation ColumCollectionViewCell

#pragma mark - 懒加载


- (UIImageView *)imageView {
    if(_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(0);
            make.bottom.equalTo(self.label.mas_top);
        }];
    }
    return _imageView;
}

- (UILabel *)label {
    if(_label == nil) {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:17];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(30);
        }];
    }
    return _label;
}

@end
