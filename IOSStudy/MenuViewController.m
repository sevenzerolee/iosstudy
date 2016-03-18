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
    
    self.view.backgroundColor = [UIColor clearColor];
    UIView *alphaView = [[UIView alloc] initWithFrame:self.view.frame];
    UIView *baseView  = [[UIView alloc] initWithFrame:self.view.frame];
    alphaView.backgroundColor = [UIColor clearColor];
//    baseView.backgroundColor  = [UIColor blackColor];
    baseView.backgroundColor = [UIColor grayColor];
    baseView.alpha = 0.2;
    
    [self.view addSubview:baseView];
    [self.view addSubview:alphaView];
    
    [sTitle setText:@"设置"];
    [sTitle setBackgroundColor:[UIColor clearColor]];
    [sTitle setTransform:CGAffineTransformMakeRotation(-M_PI / 4)];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 178, 100, 60);
    [button setTitle:@"点我返回" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor brownColor];
    
    [alphaView addSubview:button];
    [button addTarget:self action:@selector(dissmiss) forControlEvents:UIControlEventTouchUpInside];


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

- (void)dissmiss{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"返回");
    }];
}

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
