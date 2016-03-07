//
//  ViewController.m
//  TRProject
//
//  Created by jiyingxin on 16/2/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import "ColumCollectionViewCell.h"
#import "ColumViewModel.h"

@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic) ColumViewModel *viewModel;

@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *flowLayout;

@end

@implementation ViewController

+(ViewController *)shareViewController{
   
    static ViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [self new];
        vc.navi = [[UINavigationController alloc]initWithRootViewController:vc];
        vc.navigationController.navigationBar.translucent = NO;
        vc.title = @"栏目";
        vc.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    });
    return  vc;
}

#pragma mark - UICollectionViewDataSource

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    NSString *slug = [self.viewModel columSlugForRow:indexPath.row];

}

#pragma mark - UICollectionViewDataSource Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.viewModel rowCount];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ColumCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"columCell" forIndexPath:indexPath];
    [cell.imageView setImageWithURL:[self.viewModel columImageURLForRow:indexPath.row]];
    cell.label.text = [self.viewModel columNameForRow:indexPath.row];
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
        [_collectionView registerClass:[ColumCollectionViewCell class] forCellWithReuseIdentifier:@"columCell"];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        WK(weakSelf);
        [_collectionView addHeaderRefresh:^{
            [weakSelf.viewModel getDataWithRequestMode:RequestModeRefresh completionHanle:^(NSError *error) {
                if (!error) {
                    [weakSelf.collectionView reloadData];
                }
                [weakSelf.collectionView endHeaderRefresh];
            }];
        }];
	}
	return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout {
	if(_flowLayout == nil) {
		_flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumLineSpacing = 10;
        _flowLayout.minimumInteritemSpacing = 10;
        _flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        CGFloat width = (kScreenW - 10*2  - 12*2) / 3;
        CGFloat height = width * 380 / 230;
        _flowLayout.itemSize = CGSizeMake(width, height);
	}
	return _flowLayout;
}

- (ColumViewModel *)viewModel {
	if(_viewModel == nil) {
		_viewModel = [[ColumViewModel alloc] init];
	}
	return _viewModel;
}

@end
