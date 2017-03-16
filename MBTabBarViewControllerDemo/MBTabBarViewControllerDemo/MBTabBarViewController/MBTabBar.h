//
//  MBTabBar.h
//  MBTabBarDemo
//
//  Created by ZhangXiaofei on 17/3/8.
//  Copyright © 2017年 Yuri. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBTabBar;

typedef NS_ENUM(NSInteger, MBTabBarStyle) {
    MBTabBarStyleNormal = 0,
    MBTabBarStyleBulge  = 1
};

@protocol MBTabBarDelegate <NSObject>

@optional
- (void)mb_tabBar:(MBTabBar *)tabBar bulgeBtnClick:(UIButton *)btn;

@end

@interface MBTabBar : UITabBar

@property (nonatomic, weak) id<MBTabBarDelegate> centerBtnDelegate;

+ (instancetype)mb_tabBarWithStyle:(MBTabBarStyle)style bulgeBtnTitle:(NSString *)bulgeTitle bulgeBtnImage:(UIImage *)bulgeImage;

- (instancetype)initWithStyle:(MBTabBarStyle)style bulgeBtnTitle:(NSString *)bulgeTitle bulgeBtnImage:(UIImage *)bulgeImage;

@end
