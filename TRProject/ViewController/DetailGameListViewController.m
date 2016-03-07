//
//  DetailGameListViewController.m
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailGameListViewController.h"
#import "LiveListModel.h"
#import "DetailGameListNetManager.h"

@interface DetailGameListViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *flowLayout;


@end

@implementation DetailGameListViewController

#pragma mark - UICollectionView Delegate

#pragma mark - UICollectionViewDataSource Delegate

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 懒加载
- (UICollectionViewFlowLayout *)flowLayout {
	if(_flowLayout == nil) {
		_flowLayout = [[UICollectionViewFlowLayout alloc] init];
	}
	return _flowLayout;
}


- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
	}
	return _collectionView;
}

@end
