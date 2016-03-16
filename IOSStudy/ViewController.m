//
//  ViewController.m
//  IOSStudy
//
//  Created by lkimac on 16/1/12.
//  Copyright © 2016年 lkimac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"加载控制视图");
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"receivememorywarning");
    
    // Dispose of any resources that can be recreated.
}
- (IBAction)login:(id)sender {
    NSLog(@"登录");
}

- (IBAction)register:(id)sender {
    NSLog(@"注册");
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *registerViewController = [storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    registerViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:registerViewController animated:YES completion:^{
        NSLog(@"注册切换");
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"willappear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"didappear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"willdisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"diddisappear");
}

- (void)viewDidUnload {
    NSLog(@"didunload");
}



@end
