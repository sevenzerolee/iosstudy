//
//  CustomViewController.m
//  IOSStudy
//
//  Created by lkimac on 16/3/18.
//  Copyright © 2016年 lkimac. All rights reserved.
//

#import "CustomViewController.h"

#define BUTTON_WIDTH 180
#define BUTTON_HEIGHT 40
#define X (sWidth - BUTTON_WIDTH) / 2
#define Y (sHeight - BUTTON_HEIGHT) / 2

@interface CustomViewController ()

@end

@implementation CustomViewController

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
    
    float sWidth = self.view.bounds.size.width;
    float sHeight = self.view.bounds.size.height;
//    bg = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, sWidth, sHeight)];
//    float x = (sWidth - BUTTON_WIDTH) / 2;
//    float y = (sHeight - BUTTON_HEIGHT) / 2;
    
    // 背景按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, sWidth, sHeight);
    [button setTitle:@"" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor grayColor];
    button.alpha = 0.5;
    
    [alphaView addSubview:button];
    [button addTarget:self action:@selector(dissmiss) forControlEvents:UIControlEventTouchUpInside];
    
    // 标题
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"settings_triangle.png"]];
    image.frame = CGRectMake(X - 40, Y - 4*BUTTON_HEIGHT, 80, 80);
    UILabel *sTitle = [[UILabel alloc] init];
    sTitle.frame = CGRectMake(X - 38, Y - 4.7*BUTTON_HEIGHT, 80, 80);
    [sTitle setText:@"设置"];
    [sTitle setTextColor:[UIColor whiteColor]];
    [sTitle setBackgroundColor:[UIColor clearColor]];
    [sTitle setTransform:CGAffineTransformMakeRotation(-M_PI / 4)];
    
    [alphaView addSubview:image];
    [alphaView addSubview:sTitle];
    
    // 设置图片
    UIImageView *setting = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"settings.png"]];
    setting.frame = CGRectMake((sWidth - 78) / 2, Y - 4*BUTTON_HEIGHT + 20, 78, 78);
    
    [alphaView addSubview:setting];
    
    // 设置服务地址
    UIButton *server = [UIButton buttonWithType:UIButtonTypeCustom];
    server.frame = CGRectMake(X, Y - BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT);
    [server setTitle:@"服务地址" forState:UIControlStateNormal];
    [server setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [alphaView addSubview:server];
    
    // 设置用户名和密码
    UIButton *up = [UIButton buttonWithType:UIButtonTypeCustom];
    up.frame = CGRectMake(X, Y, BUTTON_WIDTH, BUTTON_HEIGHT);
    [up setTitle:@"用户息息" forState:UIControlStateNormal];
    [up setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [alphaView addSubview:up];
    
    // 检查更新
    UIButton *update = [UIButton buttonWithType:UIButtonTypeCustom];
    update.frame = CGRectMake(X, Y + BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT);
    [update setTitle:@"更新系统" forState:UIControlStateNormal];
    [update setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [alphaView addSubview:update];
    
    // 取消按钮
    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    cancel.frame = CGRectMake(X, Y + 2*BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT);
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    cancel.backgroundColor = [UIColor colorWithRed:0.141 green:0.659 blue:0.855 alpha:1];
    
    [alphaView addSubview:cancel];
    [cancel addTarget:self action:@selector(dissmiss) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dissmiss{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"返回");
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
