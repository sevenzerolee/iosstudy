//
//  CustomViewController.m
//  IOSStudy
//
//  Created by lkimac on 16/3/18.
//  Copyright © 2016年 lkimac. All rights reserved.
//

#import "CustomViewController.h"
#import "Constants.h"
#import "UserDefault.h"

#define BUTTON_WIDTH 180
#define BUTTON_HEIGHT 40
//#define X (sWidth - BUTTON_WIDTH) / 2
//#define Y (sHeight - BUTTON_HEIGHT) / 2

#define DIALOG_WIDTH 320
#define DIALOG_HEIGHT 280

#define TYPE_SET_URL 200
#define TYPE_SET_USERINFO 201
#define TYPE_CHECK_UPDATE 202


@interface CustomViewController ()

@end

@implementation CustomViewController {
    
    NSInteger type;
    
}

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
    
    // 设置对话框
    float dX = (sWidth - DIALOG_WIDTH) / 2;
    float dY = (sHeight - DIALOG_HEIGHT) / 2;
    UIView *set = [[UIView alloc] initWithFrame:CGRectMake(dX, dY, DIALOG_WIDTH, DIALOG_HEIGHT)];
    set.backgroundColor = [UIColor whiteColor];
    set.alpha = 0.8;
    
    [alphaView addSubview:set];
    
    // 标题
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"settings_triangle.png"]];
    image.frame = CGRectMake(0, 0, 80, 80);
    image.alpha = 1.0;
    UILabel *sTitle = [[UILabel alloc] init];
    sTitle.frame = CGRectMake(0, 0, 60, 60);
    sTitle.textAlignment = NSTextAlignmentCenter;
    [sTitle setText:@"设置"];
    [sTitle setTextColor:[UIColor whiteColor]];
    [sTitle setBackgroundColor:[UIColor clearColor]];
    [sTitle setTransform:CGAffineTransformMakeRotation(-M_PI / 4)];
    
//    [alphaView addSubview:image];
//    [alphaView addSubview:sTitle];
    [set addSubview:image];
    [set addSubview:sTitle];
    
    // 设置图片
    UIImageView *setting = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"settings.png"]];
    setting.frame = CGRectMake((DIALOG_WIDTH - 78) / 2, 30, 78, 78);
    
//    [alphaView addSubview:setting];
    [set addSubview:setting];
    
    float x = (DIALOG_WIDTH - BUTTON_WIDTH) / 2;
    float y = 120;
    
    // 设置服务地址
    UIButton *server = [UIButton buttonWithType:UIButtonTypeCustom];
    server.frame = CGRectMake(x, y, BUTTON_WIDTH, BUTTON_HEIGHT);
    [server setTitle:@"服务地址" forState:UIControlStateNormal];
    [server setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [server setTag:TYPE_SET_URL];
    [server addTarget:self action:@selector(setServerUrl:) forControlEvents:UIControlEventTouchUpInside];
    
//    [alphaView addSubview:server];
    [set addSubview:server];
    
    // 设置用户名和密码
    UIButton *up = [UIButton buttonWithType:UIButtonTypeCustom];
    up.frame = CGRectMake(x, y + BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT);
    [up setTitle:@"用户息息" forState:UIControlStateNormal];
    [up setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [up setTag:TYPE_SET_USERINFO];
    [up addTarget:self action:@selector(setUserInfo:) forControlEvents:UIControlEventTouchUpInside];
    
//    [alphaView addSubview:up];
    [set addSubview:up];
    
    // 检查更新
    UIButton *update = [UIButton buttonWithType:UIButtonTypeCustom];
    update.frame = CGRectMake(x, y + 2*BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT);
    [update setTitle:@"更新系统" forState:UIControlStateNormal];
    [update setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [update setTag:TYPE_CHECK_UPDATE];
    [update addTarget:self action:@selector(checkUpdate:) forControlEvents:UIControlEventTouchUpInside];
    
//    [alphaView addSubview:update];
    [set addSubview:update];
    
    // 取消按钮
    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    cancel.frame = CGRectMake(0, DIALOG_HEIGHT - BUTTON_HEIGHT, DIALOG_WIDTH, BUTTON_HEIGHT);
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    cancel.backgroundColor = [UIColor colorWithRed:0.141 green:0.659 blue:0.855 alpha:1];
    [cancel addTarget:self action:@selector(dissmiss) forControlEvents:UIControlEventTouchUpInside];
    
//    [alphaView addSubview:cancel];
    [set addSubview:cancel];
    
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

- (void)setServerUrl:(UIButton *)button{
    NSLog(@"### %ld", [button tag]);
    type = [button tag];
    
    // 提示  请输入服务地址
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"请输入服务地址"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:STR_CANCEL
                                          otherButtonTitles:STR_OK, nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alert show];
    
    [self dissmiss];
}

- (void)setUserInfo:(UIButton *)button{
    NSLog(@"### %ld", [button tag]);
    type = [button tag];
    
    // 提示  请输入用户信息
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"请输入用户信息"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:STR_CANCEL
                                          otherButtonTitles:STR_OK, nil];
    [alert setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    UITextField *username = [alert textFieldAtIndex:0];
    [username setPlaceholder:@"请输入用户名"];
    UITextField *passwd = [alert textFieldAtIndex:1];
    [passwd setPlaceholder:@"请输入密码"];
    
    [alert show];
    
    [self dissmiss];
}

- (void)checkUpdate:(UIButton *)button{
    NSLog(@"### %ld", [button tag]);
    type = [button tag];
    
    [self dissmiss];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    NSLog(@"### AlertView Response %ld, %@", (long)buttonIndex, title);
    
    if ([STR_OK isEqualToString:title]) {
        if (type == TYPE_SET_URL) {
            UITextField *url=[alertView textFieldAtIndex:0];//获得输入框
            NSLog(@"ok, %@", [url text]);
            
            [UserDefault setRootUrl:[url text]];
        }
        else if (type == TYPE_SET_USERINFO) {
            UITextField *username = [alertView textFieldAtIndex:0];
            UITextField *password = [alertView textFieldAtIndex:1];
            NSLog(@"ok, %@, %@", [username text], [password text]);
            
            [UserDefault setUserName:[username text]];
            [UserDefault setPasswd:[password text]];
        }
        else if (type == TYPE_CHECK_UPDATE) {
            NSLog(@"ok");
        }
    }
    else {
        NSLog(@"cancel");
    }
    
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"### AlertView willDismissWithButtonIndex ");
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"### AlertView didDismissWithButtonIndex ");
}

- (void)alertViewCancel:(UIAlertView *)alertView {
    NSLog(@"### AlertView alertViewCancel ");
}

@end
