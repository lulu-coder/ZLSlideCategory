//
//  TopView.h
//  ZLSlideCategory
//
//  Created by 张璐 on 15/9/3.
//  Copyright (c) 2015年 张璐. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TopView;
@protocol TopViewDelegate <NSObject>
@optional
-(void)topView:(TopView *)topView itemDidSelected:(NSInteger)item;
@end
@interface TopView : UIView
@property (nonatomic,strong) NSArray * titleArray;
@property (nonatomic,copy) NSString * titleBackgroundImage;
@property (nonatomic,copy) NSString * titleBackgroundSelectedImage;
@property (nonatomic,strong) UIColor * titleColor;
@property (nonatomic,strong) UIColor * titleSelectedColor;
@property (nonatomic,strong) UIFont * titleFont;
@property (nonatomic,assign) int currentPage;
@property (nonatomic,weak) id <TopViewDelegate> delegate;
@end
