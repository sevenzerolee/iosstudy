//
//  AppDelegate.m
//  IOSStudy
//
//  Created by lkimac on 16/1/12.
//  Copyright © 2016年 lkimac. All rights reserved.
//

#import "AppDelegate.h"
#import "SplashViewController.h"
#import "AViewController.h"
#import "BViewController.h"
#import "MenuViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize splashViewController = splashViewController;

@synthesize tabBarController = tabBarController;
@synthesize aViewController = aViewController;
@synthesize bViewController = bViewController;
@synthesize mvc = mvc;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    tabBarController = [story instantiateInitialViewController];
//    tabBarController = [[UITabBarController alloc] init];
    self.window.rootViewController = tabBarController;
    
    aViewController = [story instantiateViewControllerWithIdentifier:@"AViewController"];
    aViewController.title = @"A";
    
    bViewController = [story instantiateViewControllerWithIdentifier:@"BViewController"];
    bViewController.title = @"B";
    
    splashViewController = [story instantiateViewControllerWithIdentifier:@"SplashViewController"];
    splashViewController.title = @"splash";
    
    mvc = [story instantiateViewControllerWithIdentifier:@"MenuViewController"];
    
    tabBarController.viewControllers = @[splashViewController, aViewController, bViewController];
    
    //注意默认情况下UITabBarController在加载子视图时是懒加载的，所以这里调用一次contactController，否则在第一次展示时只有第一个控制器tab图标，contactController的tab图标不会显示
    for (UIViewController *controller in tabBarController.viewControllers) {
        UIViewController *view= controller.view;
    }
    
    
//    self.splashViewController = [story instantiateViewControllerWithIdentifier:@"SplashViewController"];
//    self.window.rootViewController = self.splashViewController;
    
//    self.splashViewController.extra = @"http://www.baidu.com";
    
    
    NSLog(@"start");
//    [NSThread sleepForTimeInterval:8];
    NSLog(@"end");
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
