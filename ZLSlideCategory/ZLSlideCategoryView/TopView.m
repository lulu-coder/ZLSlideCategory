//
//  TopView.m
//  ZLSlideCategory
//
//  Created by 张璐 on 15/9/3.
//  Copyright (c) 2015年 张璐. All rights reserved.
//

#import "TopView.h"
#import "SlideCategoryCell.h"
#define ID @"cell"
@interface TopView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionView * collectionView;

@end

@implementation TopView

-(void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
    
    if (_titleArray.count > 0) {
        
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionLeft];
    }
}

-(void)setTitleBackgroundImage:(NSString *)titleBackgroundImage
{
    _titleBackgroundImage = titleBackgroundImage;
}

-(void)setTitleBackgroundSelectedImage:(NSString *)titleBackgroundSelectedImage
{
    _titleBackgroundSelectedImage = [titleBackgroundSelectedImage copy];
    
    
}

-(void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
}

-(void)setTitleSelectedColor:(UIColor *)titleSelectedColor
{
    _titleSelectedColor = titleSelectedColor;
}

-(void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
}

-(void)setCurrentPage:(int)currentPage
{
    _currentPage = currentPage;
   [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:currentPage inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 5;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        self.collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        self.collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        
        
        [self.collectionView registerClass:[SlideCategoryCell class] forCellWithReuseIdentifier:ID];
        
        [self addSubview:self.collectionView];
        
 
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titleArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SlideCategoryCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.categoryName = self.titleArray[indexPath.item];
    cell.titleBackgroundImage = self.titleBackgroundImage;
    cell.titleBackgroundSelectedImage = self.titleBackgroundSelectedImage;
    cell.titleColor = self.titleColor;
    cell.titleSelectedColor = self.titleSelectedColor;
    cell.titleFont = self.titleFont;
    
    return cell;
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 40);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SlideCategoryCell * cell = (SlideCategoryCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.selected = YES;
    if (self.delegate && [self.delegate respondsToSelector:@selector(topView:itemDidSelected:)]) {
        [self.delegate topView:self itemDidSelected:indexPath.item];
    }
        
}


@end
