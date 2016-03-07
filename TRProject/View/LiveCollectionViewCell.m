//
//  LiveCollectionViewCell.m
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LiveCollectionViewCell.h"

@implementation LiveCollectionViewCell


#pragma mark - 懒加载
- (UIImageView *)thumb {
    if(_thumb == nil) {
        _thumb = [[UIImageView alloc] init];
        _thumb.contentMode = UIViewContentModeScaleAspectFill;
        _thumb.clipsToBounds = YES;
        [self addSubview:_thumb];
        [_thumb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.bottom.equalTo(self.title.mas_top);
        }];
    }
    return _thumb;
}

- (UILabel *)title {
    if(_title == nil) {
        _title = [[UILabel alloc] init];
        _title.font = [UIFont systemFontOfSize:17];
        [self addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(25);
        }];
    }
    return _title;
}

- (UIImageView *)nickImageView {
    if(_nickImageView == nil) {
        _nickImageView = [[UIImageView alloc] init];
        [_nickImageView setImage:[UIImage imageNamed:@"主播名@3x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.3996.000.00."]];
        _nickImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.backView addSubview:_nickImageView];
        [_nickImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(2);
            make.bottom.equalTo(-2);
            make.left.equalTo(2);
            make.width.equalTo(self.nickImageView.mas_height);
        }];
    }
    return _nickImageView;
}

- (UILabel *)nickLable {
    if(_nickLable == nil) {
        _nickLable = [[UILabel alloc] init];
        _nickLable.font = [UIFont systemFontOfSize:13];
        _nickLable.textColor = [UIColor whiteColor];
        [_nickLable sizeToFit];
        [self.backView addSubview:_nickLable];
        [_nickLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(0);
            make.left.equalTo(self.nickImageView.mas_right).equalTo(3);
        }];
    }
    return _nickLable;
}

- (UIImageView *)viewImageView {
    if(_viewImageView == nil) {
        _viewImageView = [[UIImageView alloc] init];
        [_viewImageView setImage:[UIImage imageNamed:@"主播名@3x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.3996.000.00."]];
        _viewImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.backView addSubview:_viewImageView];
        [_viewImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(2);
            make.bottom.equalTo(-2);
            make.right.equalTo(self.viewLabel.mas_left).equalTo(-2);
            make.width.equalTo(self.viewImageView.mas_height);
        }];
    }
    return _viewImageView;
}

- (UILabel *)viewLabel {
    if(_viewLabel == nil) {
        _viewLabel = [[UILabel alloc] init];
        _viewLabel.font = [UIFont systemFontOfSize:13];
        _viewLabel.textColor = [UIColor whiteColor];
        [self.backView addSubview:_viewLabel];
        [_viewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(0);
            make.top.bottom.equalTo(0);
        }];
    }
    return _viewLabel;
}

- (UIView *)backView {
    if(_backView == nil) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = kRGBA(38, 32, 34, 0.5);
        [self addSubview:_backView];
        [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.title.mas_top);
            make.left.right.equalTo(0);
            make.height.equalTo(20);
        }];
    }
    return _backView;
}

@end
