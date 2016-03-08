//
//  SearchViewController.m
//  TRProject
//
//  Created by tarena on 16/3/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
@property (nonatomic) UITextField *searchText;
@property (nonatomic) UISegmentedControl *seg;


@end

@implementation SearchViewController

-(instancetype)init{
    if (self = [super init]) {
        NSLog(@"呵呵呵呵呵呵");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    self.navigationItem.titleView = self.seg;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
- (UITextField *)searchText {
	if(_searchText == nil) {
		_searchText = [[UITextField alloc] init];
        _searchText.placeholder = @"请输入关键字";
        _searchText.backgroundColor = [UIColor whiteColor];
        [_searchText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(200);
            make.height.equalTo(30);
        }];
	}
	return _searchText;
}

- (UISegmentedControl *)seg {
	if(_seg == nil) {
		_seg = [[UISegmentedControl alloc] initWithItems:@[@"额呵呵",@"嘻嘻嘻",@"哈哈哈"]];
        _seg.selectedSegmentIndex = 0;
	}
	return _seg;
}

@end
