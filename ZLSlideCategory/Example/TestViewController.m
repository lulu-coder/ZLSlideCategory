//
//  TestViewController.m
//  ZLSlideCategory
//
//  Created by 张璐 on 15/9/4.
//  Copyright (c) 2015年 张璐. All rights reserved.
//

#import "TestViewController.h"
#import "ZLSlideCategoryView.h"
@interface TestViewController ()<ZLSlideCategoryViewDataSource,ZLSlideCategoryViewDelegate>
@property (nonatomic,strong) NSArray * categoryArray;
@property (nonatomic,weak) ZLSlideCategoryView * zlView;

@end

@implementation TestViewController

-(NSArray *)categoryArray
{
    if (_categoryArray == nil) {
        self.categoryArray = @[@"分类1",@"分类2",@"分类3",@"分类4",@"分类5",@"分类6"];
    }
    return _categoryArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    ZLSlideCategoryView * zlView = [[ZLSlideCategoryView alloc]init];
    zlView.titleArray = self.categoryArray;
    zlView.titleBackgroundSelectedImage = @"NBQuan_menu_selected";
    zlView.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20);
    zlView.dataSource = self;
    zlView.delegate = self;
    self.zlView = zlView;
    
    [self.view addSubview:zlView];
 
    
}
-(NSInteger)numberOfContentViewInZLSlideCategoryView:(ZLSlideCategoryView *)slideCategoryView
{
    return self.categoryArray.count;
}
-(UIView *)slideCategoryView:(UIView *)view viewForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIView * v = [[UIView alloc]init];
    v.backgroundColor = [UIColor colorWithRed:random()%255/255.0 green:random()%255/255.0 blue:random()%255/255.0 alpha:1];
    return v;
    
}

@end
