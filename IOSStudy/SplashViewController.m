//
//  SplashViewController.m
//  IOSStudy
//
//  Created by lkimac on 16/1/14.
//  Copyright © 2016年 lkimac. All rights reserved.
//

#import "SplashViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomAlertView.h"
#import <QuartzCore/QuartzCore.h>
#import "CAlertView.h"
#import "AppDelegate.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

@synthesize extra = extra;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [background setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"settings_triangle.png"]]];
    
//    UIImageView *image = [[UIImageView alloc] init];
//    [image setImage:@"settings_triangle.png"];
//    [background addSubview:image];
//    [background sendSubviewToBack:image];
    
    self.title = @"Test";
    
    NSLog(@"label value %@", [label text]);
    [label setText:@"设置"];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTransform:CGAffineTransformMakeRotation(-M_PI / 4)];
    
    NSLog(@"extra %@", extra);
    if (extra) {
        NSLog(@"not empty");
    }
    else {
        NSLog(@"empty");
        
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
//        viewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//        
////        [[[UIApplication sharedApplication] delegate] window].rootViewController ;
//        
//        [[[[UIApplication sharedApplication] delegate] window].rootViewController presentViewController:viewController animated:YES completion:^{
//            NSLog(@"empty view");
//        }];
        
//        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// ## IOS 摇一摇功能 start
- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"### motion begin ");
    
    
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"### motion end ");
    
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"经过推送发送过来的消息"
                                                            message:@"Message"
                                                           delegate:self
                                                  cancelButtonTitle:@"关闭"
                                                  otherButtonTitles:@"处理", nil];
    UIButton *set = [[UIButton alloc] init];
    [set setTitle:@"set" forState:UIControlStateApplication];
    
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        [alert setValue:set forKey:@"accessoryView"];
    }else{
        [alert addSubview:set];
    }
    
    [alert show];
    
    
    
    
    
//    CustomAlertView *alert = [[CustomAlertView alloc] initWithTitle:@"设置" message:@"设置" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
//    [alert show];
    
//    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
//    
//    [alertView setContainerView:[self customView]];
//    
//    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"取消", @"确定", nil]];
//    [alertView setDelegate: self];
//    
//    [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
////        NSLog(@"点击了%@按钮",result);
////        NSString *result = alertView.buttonTitles[buttonIndex];
////        [alertView close];
//    }];
//    
//    [alertView setUseMotionEffects:true];
//    [alertView show];
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"### motion cancel ");
}

- (UIView *)customView
{
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 240, 160)];
    
    UILabel *tip=[[UILabel alloc]initWithFrame:CGRectMake(100, 10, 50, 30)];
    [tip setText:@"提示"];
    [customView addSubview:tip];
    
    
    UILabel *content=[[UILabel alloc]initWithFrame:CGRectMake(10, 60, 210, 30)];
    [content setText:@"http://www.cnblogs.com/xiaofeixiang"];
    [content setFont:[UIFont systemFontOfSize:12]];
    [customView addSubview:content];
    return customView;
}

// ## IOS 摇一摇功能 end

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)test:(id)sender {
    NSLog(@"click");
    
//    float sWidth = self.view.bounds.size.width;
//    float sHeight = self.view.bounds.size.height;
    
//    self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
//    self.modalPresentationStyle = UIModalPresentationCurrentContext;
//    self.view.backgroundColor = [UIColor clearColor];
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    UIViewController *mvc = (UIViewController *)delegate.mvc;
    
//    mvc.view.frame = CGRectMake(0, sHeight, sWidth, sHeight);
//    
//    [self.view addSubview:mvc.view];
//    
//    [UIView animateWithDuration:0.5 animations:^{
//        mvc.view.frame = CGRectMake(0, 0, sWidth, sHeight);
//    } completion:^(BOOL finished) {
//        NSLog(@"切换");
//    }];
    
    
    
    
//    mvc.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2] ;
//    mvc.view.alpha = 0;
//    mvc.view.backgroundColor = [UIColor clearColor];
//    mvc.modalPresentationStyle = UIModalPresentationCurrentContext;
    mvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        mvc.providesPresentationContextTransitionStyle = YES;
        mvc.definesPresentationContext = YES;
        mvc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        
        [self presentViewController:mvc animated:YES completion:^{
            NSLog(@"视图切换");
        }];
    }
    else {
        self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
        [self presentViewController:mvc animated:NO completion:^{
            NSLog(@"视图切换");
        }];
        self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    }
    
//    self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
//    [self.view.window.rootViewController presentViewController:mvc animated:YES completion:^{
//        NSLog(@"视图切换");
////        mvc.view.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
//    }];
//    self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    
//    [self presentViewController: mvc animated:YES completion:^{
//        NSLog(@"视图切换");
//    }];
    
//    float vWidth = 300;
//    float vHeight = 150;
    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake((sWidth - vWidth)/2, (sHeight - vHeight)/2, vWidth, vHeight)];
//    [view setBackgroundColor:[UIColor blueColor]];
//    [[view layer] shadowColor] = [[UIColor grayColor] CGColor];
    
//    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"经过推送发送过来的消息"
//                                                    message:@"Message"
//                                                   delegate:self
//                                          cancelButtonTitle:@"关闭"
//                                          otherButtonTitles:@"处理", nil];
////    UIButton *set = [[UIButton alloc] initWithFrame:CGRectMake(180, 10, 200, 40)];
////    [set setTitle:@"set" forState:UIControlStateApplication];
//    
//    UILabel *set = [[UILabel alloc] initWithFrame:CGRectMake(180, 5, 85, 75)];
//    [set setText:@"Title"];
//    
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(180, 5, 85, 75)];
//    UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(0,0,400, 35)];
//    UITextField *tf2 = [[UITextField alloc]initWithFrame:CGRectMake(0,37,400, 35)];
//    tf.backgroundColor = [UIColor whiteColor];
//    tf2.backgroundColor = [UIColor whiteColor];
//    [view addSubview:tf];
//    [view addSubview:tf2];
//    
//    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
//        [alert setValue:set forKey:@"accessoryView"];
//    }else{
//        [alert addSubview:set];
//    }
//    
//    [alert show];
    
    
    
    
    
    
    
    
    
    
//    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
//    　　[view setBackgroundColor:[UIColor blueColor]];
//    
//    　UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setBackgroundColor:[UIColor grayColor]];
//    [button setFrame:CGRectMake(0, 0, 80, 20)];
//    [button setTitle:@"消失" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(alertDismiss) forControlEvents:UIControlEventTouchUpInside];
//    [view addSubview:button];
//    
//    
//    UIView* viewbg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
//    [viewbg setBackgroundColor:[UIColor redColor]];
//    
//    
//    CAlertView *alert = [[CAlertView alloc] initWithView:view];
//    [alert setBackGroundView:viewbg];
//    
//    viewbg = nil;
//    alert.delegate = self;
//        view = nil;
//    [alert show];
}

- (IBAction)alert:(id)sender {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                        message:@"AlertMessage"
                                                       delegate:self
                                              cancelButtonTitle:@"ok"
                                              otherButtonTitles:nil, nil];
    [alert show];
}

- (IBAction)view:(id)sender {
    NSLog(@"###");
//    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
//    UIViewController *vc = (UIViewController *)delegate.cvc;
//    UIView *view = [vc view];
    
    
    
//    delegate.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
//    [delegate.window.rootViewController presentViewController:vc animated:YES completion:^{
//        delegate.window.rootViewController.modalPresentationStyle = UIModalPresentationFullScreen;
//    }];
    
}


//








@end
