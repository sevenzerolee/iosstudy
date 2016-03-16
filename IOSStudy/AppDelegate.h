//
//  AppDelegate.h
//  IOSStudy
//
//  Created by lkimac on 16/1/12.
//  Copyright © 2016年 lkimac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AViewController.h"
#import "BViewController.h"

@class SplashViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    SplashViewController *splashViewController;
    
    UITabBarController *tabBarController;
    AViewController *aViewController;
    BViewController *bViewController;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SplashViewController *splashViewController;

@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) AViewController *aViewController;
@property (strong, nonatomic) BViewController *bViewController;


@end

