//
//  ZLSlideCategoryView.m
//  ZLSlideCategory
//
//  Created by 张璐 on 15/9/3.
//  Copyright (c) 2015年 张璐. All rights reserved.
//

#import "ZLSlideCategoryView.h"
#import "TopView.h"

@interface ZLSlideCategoryView ()<UIScrollViewDelegate,TopViewDelegate>

@property (nonatomic,strong) TopView * topView;
@property (nonatomic,strong) UIScrollView * scrollView;
@property (nonatomic,strong) NSMutableArray * contentViewArray;

@end

@implementation ZLSlideCategoryView

-(void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
    self.topView.titleArray = titleArray;
}

-(void)setTitleBackgroundImage:(NSString *)titleBackgroundImage
{
    _titleBackgroundImage = titleBackgroundImage;
    self.topView.titleBackgroundImage = titleBackgroundImage;
}

-(void)setTitleBackgroundSelectedImage:(NSString *)titleBackgroundSelectedImage
{
    _titleBackgroundSelectedImage = [titleBackgroundSelectedImage copy];
    self.topView.titleBackgroundSelectedImage = titleBackgroundSelectedImage;
    
}

-(void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    self.topView.titleColor = titleColor;
}

-(void)setTitleSelectedColor:(UIColor *)titleSelectedColor
{
    _titleSelectedColor = titleSelectedColor;
    self.topView.titleSelectedColor = titleSelectedColor;
}

-(void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    self.topView.titleFont = titleFont;
}

-(NSMutableArray *)contentViewArray
{
    if (_contentViewArray == nil) {
        self.contentViewArray = [NSMutableArray array];
    }
    return _contentViewArray;
}


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.topView = [[TopView alloc]init];
        self.topView.delegate = self;
        [self addSubview:self.topView];

        self.scrollView = [[UIScrollView alloc]init];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.delegate = self;
        [self addSubview:self.scrollView];
        
        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.topView.frame = CGRectMake(0, 0, self.frame.size.width, 60);
    self.scrollView.frame = CGRectMake(0, CGRectGetMaxY(self.topView.frame), self.frame.size.width, self.frame.size.height - self.topView.frame.size.height);
    
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(numberOfContentViewInZLSlideCategoryView:)]) {
        
        [self.contentViewArray makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self.contentViewArray removeAllObjects];
        
        NSInteger num = [self.dataSource numberOfContentViewInZLSlideCategoryView:self];
        
        for (int i = 0; i < num; i ++) {
            if ([self.dataSource respondsToSelector:@selector(slideCategoryView:viewForItemAtIndexPath:)]) {
                NSIndexPath * indexPath = [NSIndexPath indexPathForItem:i inSection:0];
                UIView * view = [self.dataSource slideCategoryView:self viewForItemAtIndexPath:indexPath];
                view.frame = CGRectMake(i * self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
                [self.scrollView addSubview:view];
                [self.contentViewArray addObject:view];
                
            }
        }
        self.scrollView.contentSize = CGSizeMake(num * self.scrollView.frame.size.width, 0);
    }

}

-(void)reloadView
{
    [self setNeedsDisplay];
}

-(void)topView:(TopView *)topView itemDidSelected:(NSInteger)item
{
    [self.scrollView setContentOffset:CGPointMake(item * self.frame.size.width, 0) animated:NO];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    double pageDouble = offsetX/scrollView.frame.size.width;
    int pageInt = (int)(pageDouble + 0.5);
    self.topView.currentPage = pageInt;
    
}

@end
