//
//  LiveListViewController.m
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LiveListViewController.h"

@interface LiveListViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic) UICollectionView *collectionView;


@end

@implementation LiveListViewController


#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - 懒加载
- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
		_collectionView = [[UICollectionView alloc] init];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
	}
	return _collectionView;
}

@end
