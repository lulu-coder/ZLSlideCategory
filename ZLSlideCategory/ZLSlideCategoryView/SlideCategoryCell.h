//
//  SlideCategoryCell.h
//  ZLSlideCategory
//
//  Created by 张璐 on 15/9/4.
//  Copyright (c) 2015年 张璐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideCategoryCell : UICollectionViewCell

@property (nonatomic,copy) NSString * categoryName;
@property (nonatomic,copy) NSString * titleBackgroundImage;
@property (nonatomic,copy) NSString * titleBackgroundSelectedImage;
@property (nonatomic,strong) UIColor * titleColor;
@property (nonatomic,strong)UIColor * titleSelectedColor;
@property (nonatomic,strong) UIFont * titleFont;

@end
