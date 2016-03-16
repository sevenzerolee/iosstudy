//
//  SplashViewController.h
//  IOSStudy
//
//  Created by lkimac on 16/1/14.
//  Copyright © 2016年 lkimac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplashViewController : UIViewController {
    NSString *extra;
    IBOutlet UIView *background;
    IBOutlet UILabel *label;
}

@property (nonatomic, strong) NSString *extra;
- (IBAction)test:(id)sender;

@end
