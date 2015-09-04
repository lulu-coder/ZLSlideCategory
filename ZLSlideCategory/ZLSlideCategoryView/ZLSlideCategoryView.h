//
//  ZLSlideCategoryView.h
//  ZLSlideCategory
//
//  Created by 张璐 on 15/9/3.
//  Copyright (c) 2015年 张璐. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZLSlideCategoryView;

@protocol ZLSlideCategoryViewDataSource <NSObject>
@required
-(NSInteger)numberOfContentViewInZLSlideCategoryView:(ZLSlideCategoryView *)slideCategoryView;
-(UIView *)slideCategoryView:(UIView *)view viewForItemAtIndexPath:(NSIndexPath *)indexPath;
@end

@protocol ZLSlideCategoryViewDelegate <NSObject>
@optional
-(void)ZLSlideCategoryView:(ZLSlideCategoryView *)slideCategoryView didScrollItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface ZLSlideCategoryView : UIView

@property (nonatomic,weak) id <ZLSlideCategoryViewDataSource> dataSource;
@property (nonatomic,weak) id <ZLSlideCategoryViewDelegate> delegate;
/**
 *  顶部分类标题数组
 */
@property (nonatomic,strong) NSArray * titleArray;
/**
 *  顶部分类标题普通状态下背景图片
 */
@property (nonatomic,copy) NSString * titleBackgroundImage;
/**
 *  顶部分类标题选中状态下背景图片
 */
@property (nonatomic,copy) NSString * titleBackgroundSelectedImage;
/**
 *  顶部分类标题普通状态下文字颜色
 */
@property (nonatomic,strong) UIColor * titleColor;
/**
 *  顶部分类标题选中状态下文字颜色
 */
@property (nonatomic,strong) UIColor * titleSelectedColor;
/**
 *  顶部分类标题文字字体
 */
@property (nonatomic,strong) UIFont * titleFont;

-(void)reloadView;

@end
