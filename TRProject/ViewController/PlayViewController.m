//
//  PlayViewController.m
//  TRProject
//
//  Created by tarena on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PlayViewController.h"
#import "LiveCollectionViewCell.h"
#import "LiveListViewModel.h"

@interface PlayViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) LiveListViewModel *listViewModel;
@property (nonatomic) UICollectionViewFlowLayout *flowLayout;


@end

@implementation PlayViewController
#pragma mark - UICollectionViewDelegateFlowLayout Delegate

//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    return 10;
//}
//
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return 10;
//}
//
//- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(10, 10, 10, 10);
//}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    // 350 260
//    CGFloat width = (kScreenW - 12*3) /2;
//    CGFloat height = width * 260 / 350;
//    return CGSizeMake(width, height);
//}

+ (PlayViewController *)sharePlayViewController{
    static PlayViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [self new];
        vc.navi = [[UINavigationController alloc]initWithRootViewController:vc];
        vc.navigationController.navigationBar.translucent = NO;
        vc.title = @"直播";
        vc.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
        vc.tabBarItem.image = [[UIImage imageNamed:@"发现-默认@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.53246.000.00."] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:@"发现-焦点@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.18619.000.00."] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    });
    return vc;
}

#pragma mark - UICollectionViewDelegate Delegate

#pragma mark - UICollectionViewDataSource Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.listViewModel.rowNumber;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LiveCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"liveCell" forIndexPath:indexPath];
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
    self.view.backgroundColor = [UIColor whiteColor];
    [self.collectionView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - 懒加载
- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[LiveCollectionViewCell class] forCellWithReuseIdentifier:@"liveCell"];
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
//                    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES];
//                    hub.mode = MBProgressHUDModeText;
//                    hub.labelText = @"已经没有数据了";
//                    [hub hide:YES afterDelay:1.0];
                }
                [weakSelf.collectionView endHeaderRefresh];
            }];
        }];
        [_collectionView addAutoFooterRefresh:^{
            [weakSelf.listViewModel getDataWithRequestMode:RequestModeMore completionHanle:^(NSError *error) {
                if (!error) {
                    [weakSelf.collectionView reloadData];
                }else{
                    
                }
                NSLog(@"error********:%@",error);
                [weakSelf.collectionView endFooterRefresh];
            }];
        }];
    }
	return _collectionView;
}

- (LiveListViewModel *)listViewModel {
	if(_listViewModel == nil) {
		_listViewModel = [[LiveListViewModel alloc] init];
	}
	return _listViewModel;
}

- (UICollectionViewFlowLayout *)flowLayout {
	if(_flowLayout == nil) {
		_flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumLineSpacing = 10;
        _flowLayout.minimumInteritemSpacing = 10;
        _flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        CGFloat width = (kScreenW - 12*3) /2;
        CGFloat height = width * 260 / 350;
        _flowLayout.itemSize = CGSizeMake(width, height);
	}
	return _flowLayout;
}

@end
