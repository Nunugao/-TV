//
//  DetailGameListViewController.m
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailGameListViewController.h"
#import "DetailGameListNetManager.h"
#import "LiveCollectionViewCell.h"
#import "LiveListViewModel.h"

@interface DetailGameListViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic) LiveListViewModel *listViewModel;


@end

@implementation DetailGameListViewController

#pragma mark - UICollectionView Delegate

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    NSLog(@"aaaaaaa");
}

#pragma mark - UICollectionViewDataSource Delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.listViewModel.rowNumber;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LiveCollectionViewCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    [cell.thumb setImageWithURL:[self.listViewModel thumbForRow:row]];
    cell.title.text  = [self.listViewModel titleForRow:row];
    cell.nickLable.text = [self.listViewModel nickForRow:row];
    cell.viewLabel.text = [self.listViewModel viewForRow:row];
    return cell;
    
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _columModel.name;
    [self.collectionView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 懒加载
- (UICollectionViewFlowLayout *)flowLayout {
	if(_flowLayout == nil) {
		_flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumLineSpacing = 10;
        _flowLayout.minimumInteritemSpacing = 10;
        _flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        // 350 260
        CGFloat width = (kScreenW - 3*10) / 3;
        CGFloat height = width * 260 / 350;
        _flowLayout.itemSize = CGSizeMake(width, height);
	}
	return _flowLayout;
}


- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        
        [_collectionView registerClass:[LiveCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
        WK(weakSelf);
        [_collectionView addHeaderRefresh:^{
            [weakSelf.listViewModel getDataWithRequestMode:RequestModeRefresh completionHanle:^(NSError *error) {
                if (!error) {
                    [weakSelf.collectionView reloadData];
                }else{
                    NSLog(@"error:%@",error);
                }
                [weakSelf.collectionView endHeaderRefresh];
            }];
        }];
        
        [_collectionView addAutoFooterRefresh:^{
            [weakSelf.listViewModel getDataWithRequestMode:RequestModeMore completionHanle:^(NSError *error) {
                if (!error) {
                    [weakSelf.collectionView reloadData];
                }
                [weakSelf.collectionView endFooterRefresh];
            }];
        }];
	}
	return _collectionView;
}
@end
