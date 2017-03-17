//
//  AppDelegate.m
//  MBTabBarViewControllerDemo
//
//  Created by ZhangXiaofei on 17/3/16.
//  Copyright © 2017年 Yuri. All rights reserved.
//

#import "AppDelegate.h"
#import "MBTabBarViewController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    MBTabBarViewController *tabVC = [[MBTabBarViewController alloc] initWithTabBarStyle:MBTabbarViewControllerStyleBulge bulgeBtnTitle:@"HelloWorld" bulgeBtnImage:[UIImage imageNamed:@"5"]];
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = [UIColor redColor];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor blueColor];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor grayColor];
    
    ViewController *vc5 = [[ViewController alloc] init];
    vc5.view.backgroundColor = [UIColor yellowColor];
    
    [tabVC addChildVc:vc1 title:@"Title1" image:[UIImage imageNamed:@"1"] selectedImage:[UIImage imageNamed:@"1"]];
    [tabVC addChildVc:vc2 title:@"Title2" image:[UIImage imageNamed:@"2"] selectedImage:[UIImage imageNamed:@"1"]];
    [tabVC addChildVc:vc3 title:@"Title3" image:[UIImage imageNamed:@"3"] selectedImage:[UIImage imageNamed:@"1"]];
    [tabVC addChildVc:vc4 title:@"Title4" image:[UIImage imageNamed:@"4"] selectedImage:[UIImage imageNamed:@"1"]];
    
    tabVC.selectionIndicatorColor = [UIColor redColor];
    tabVC.tabBarBackgroundColor = [UIColor blueColor];
    tabVC.tabBarSelectedTitleColor = [UIColor yellowColor];
    tabVC.tabBarNormalTitleColor = [UIColor grayColor];
    tabVC.tabbarViewControllerBuldgeControl = MBTabbarViewControllerBuldgeControlChild;
    tabVC.centerViewController = vc5;
    
    self.window = [[UIWindow alloc] init];
    self.window.rootViewController = tabVC;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
