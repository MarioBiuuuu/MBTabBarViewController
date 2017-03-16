//
//  MBTabBarViewController.h
//  LKBaseTabbarController
//
//  Created by ZhangXiaofei on 17/3/16.
//  Copyright © 2017年 Yuri. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MBTabbarViewControllerStyle) {
    MBTabbarViewControllerStyleNormal = 0,
    MBTabbarViewControllerStyleBulge  = 1
};

@class MBTabBarViewController;

@protocol MBtabBarViewControllerDelegate <NSObject>

@optional
- (void)mb_tabBarViewController:(MBTabBarViewController *)tabBarViewController centerButtonClick:(UIButton *)centerBtn;

@end

typedef void(^CenterButtonHandler)(MBTabBarViewController *tabBarViewController, UIButton *centerBtn);

@interface MBTabBarViewController : UITabBarController

@property (nonatomic, weak) id<MBtabBarViewControllerDelegate> centerButtonDelegate;

@property (nonatomic,copy) CenterButtonHandler centerButtonHandler;

- (instancetype)initWithTabBarStyle:(MBTabbarViewControllerStyle)style bulgeBtnTitle:(NSString *)bulgeTitle bulgeBtnImage:(UIImage *)bulgeImage;

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;

- (void)addChildVcs:(NSArray <UIViewController *>*)childVcs titles:(NSArray <NSString *>*)titles images:(NSArray <UIImage *>*)images selectedImages:(NSArray <UIImage *>*)selectedImages;

- (void)centerButtonClick:(CenterButtonHandler)handler;
@end
