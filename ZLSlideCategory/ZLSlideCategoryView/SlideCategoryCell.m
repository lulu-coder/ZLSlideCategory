//
//  SlideCategoryCell.m
//  ZLSlideCategory
//
//  Created by 张璐 on 15/9/4.
//  Copyright (c) 2015年 张璐. All rights reserved.
//

#import "SlideCategoryCell.h"

@interface SlideCategoryCell ()
@property(nonatomic,weak)UIButton * categoryBtn;
@end
@implementation SlideCategoryCell

-(void)setCategoryName:(NSString *)categoryName
{
    _categoryName = [categoryName copy];
    [self.categoryBtn setTitle:categoryName forState:UIControlStateNormal];
}

-(void)setTitleBackgroundImage:(NSString *)titleBackgroundImage
{
    if (titleBackgroundImage) {
        
    _titleBackgroundImage = titleBackgroundImage;
    [self.categoryBtn setBackgroundImage:[UIImage imageNamed:titleBackgroundImage] forState:UIControlStateNormal];
    }
    
}

-(void)setTitleBackgroundSelectedImage:(NSString *)titleBackgroundSelectedImage
{
    if (titleBackgroundSelectedImage) {
        
    _titleBackgroundSelectedImage = [titleBackgroundSelectedImage copy];
    [self.categoryBtn setBackgroundImage:[UIImage imageNamed:titleBackgroundSelectedImage] forState:UIControlStateSelected];
    }
    
    
}

-(void)setTitleColor:(UIColor *)titleColor
{
    if (titleColor) {
        
    _titleColor = titleColor;
    [self.categoryBtn setTitleColor:titleColor forState:UIControlStateNormal];
        
    }
    
}

-(void)setTitleSelectedColor:(UIColor *)titleSelectedColor
{
    if (titleSelectedColor) {
        
    _titleSelectedColor = titleSelectedColor;
    [self.categoryBtn setTitleColor:titleSelectedColor forState:UIControlStateSelected];
 
    }
}

-(void)setTitleFont:(UIFont *)titleFont
{
    if (titleFont) {
        
        _titleFont = titleFont;
        self.categoryBtn.titleLabel.font = titleFont;

    }
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    self.categoryBtn.selected = self.selected;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIButton * categoryBtn = [[UIButton alloc]init];
        categoryBtn.userInteractionEnabled = NO;
        self.categoryBtn = categoryBtn;
        [self.contentView addSubview:categoryBtn];
        self.titleColor = [UIColor grayColor];
        self.titleSelectedColor = [UIColor redColor];
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.categoryBtn.frame = self.bounds;
    
}
@end
