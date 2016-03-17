//
//  MenuViewController.m
//  IOSStudy
//
//  Created by lkimac on 16/3/16.
//  Copyright © 2016年 lkimac. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [sTitle setText:@"设置"];
    [sTitle setBackgroundColor:[UIColor clearColor]];
    [sTitle setTransform:CGAffineTransformMakeRotation(-M_PI / 4)];
    
//    bgBtn.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"Menu");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)hide:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"返回");
    }];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"返回");
    }];
}
@end
