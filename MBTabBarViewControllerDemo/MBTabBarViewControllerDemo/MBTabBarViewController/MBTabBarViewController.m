//
//  MBTabBarViewController.m
//  LKBaseTabbarController
//
//  Created by ZhangXiaofei on 17/3/16.
//  Copyright © 2017年 Yuri. All rights reserved.
//

#import "MBTabBarViewController.h"
#import "MBTabBar.h"

@interface MBTabBarViewController () <MBTabBarDelegate>

@property (nonatomic, assign) MBTabbarViewControllerStyle tabbarStyle;

@property (nonatomic, copy) NSString *bulgeTitle;

@property (nonatomic, strong) UIImage *bulgeImage;

@end

@implementation MBTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (instancetype)initWithTabBarStyle:(MBTabbarViewControllerStyle)style bulgeBtnTitle:(NSString *)bulgeTitle bulgeBtnImage:(UIImage *)bulgeImage {
    
    if (self = [super init]) {
        
        self.tabbarStyle = style;
        self.bulgeTitle = bulgeTitle;
        self.bulgeImage = bulgeImage;
        [self initialTabBar];

    }
    
    return self;
}

- (void)initialTabBar {
    MBTabBarStyle style = MBTabBarStyleNormal;
    switch (self.tabbarStyle) {
        case MBTabbarViewControllerStyleNormal:
            style = MBTabBarStyleNormal;
            break;
        case MBTabbarViewControllerStyleBulge:
            style = MBTabBarStyleBulge;
            break;
        default:
            break;
    }
    
    MBTabBar *tabBar = [[MBTabBar alloc] initWithStyle:style bulgeBtnTitle:self.bulgeTitle bulgeBtnImage:self.bulgeImage];
    tabBar.translucent = NO;
    tabBar.centerBtnDelegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVc.title = title;
    
    // 设置子控制器的tabBarItem图片
    childVc.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 禁用图片渲染
    childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} forState:UIControlStateSelected];
    //    childVc.view.backgroundColor = RandomColor; // 这句代码会自动加载主页，消息，发现，我四个控制器的view，但是view要在我们用的时候去提前加载
    
    // 为子控制器包装导航控制器
    UINavigationController *navigationVc = [[UINavigationController alloc] initWithRootViewController:childVc];
    // 添加子控制器
    [self addChildViewController:navigationVc];
    
}

- (void)addChildVcs:(NSArray <UIViewController *>*)childVcs titles:(NSArray <NSString *>*)titles images:(NSArray <UIImage *>*)images selectedImages:(NSArray <UIImage *>*)selectedImages {
    NSAssert((childVcs.count == titles.count && childVcs.count == images.count && childVcs.count == selectedImages.count), @"You must set the same number of controller and properties. (你必须设置相同数量的属性和属性对应)");
    if (childVcs.count == titles.count && childVcs.count == images.count && childVcs.count == selectedImages.count) {
        for (int i = 0; i < childVcs.count; i ++) {
            UIViewController *child = childVcs[i];
            NSString *title = titles[i];
            UIImage *normalImage = images[i];
            UIImage *selectedImage = selectedImages[i];
            
            if (child) {
                [self addChildVc:child title:title image:normalImage selectedImage:selectedImage];
            }
        }
    }
}

#pragma mark - MBTabBarDelegate
- (void)mb_tabBar:(MBTabBar *)tabBar bulgeBtnClick:(UIButton *)btn {
    NSLog(@"+++++++++++++++");
    if (self.centerButtonDelegate && [self.centerButtonDelegate respondsToSelector:@selector(mb_tabBarViewController:centerButtonClick:)]) {
        [self.centerButtonDelegate mb_tabBarViewController:self centerButtonClick:btn];
    } else {
        if (self.centerButtonHandler) {
            self.centerButtonHandler(self, btn);
        }
    }
}

#pragma mark - CenterButtonClick block
- (void)centerButtonClick:(CenterButtonHandler)handler {
    self.centerButtonHandler = handler;
}

@end
