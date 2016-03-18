//
//  AViewController.m
//  IOSStudy
//
//  Created by lkimac on 16/3/16.
//  Copyright © 2016年 lkimac. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"A");
    self.title = @"WebView";
    
//    float width = self.view.bounds.size.width;
//    float height = self.view.bounds.size.height;
//    webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    webview.dataDetectorTypes = UIDataDetectorTypeAll;
    webview.delegate = self;
    
//    [self.view addSubview:webview];
    
    NSString *server = @"http://www.baidu.com";
    [self request:server];
    
    search.text = server;
    search.delegate = self;
    
}

- (void)request:(NSString *)str {
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webview loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// webview start

#pragma mark - WebView 代理方法
#pragma mark 开始加载
-(void)webViewDidStartLoad:(UIWebView *)webView{
    //显示网络请求加载
    [UIApplication sharedApplication].networkActivityIndicatorVisible = true;
}

#pragma mark 加载完毕
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    //隐藏网络请求加载图标
    [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
    
}
#pragma mark 加载失败
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"error detail:%@",error.localizedDescription);
//    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"系统提示" message:@"网络连接发生错误!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//    [alert show];
}

// webview end

// search start

#pragma mark - SearchBar 代理方法
#pragma mark 点击搜索按钮或回车
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self request:searchBar.text];
}

// search end

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)back:(id)sender {
    if (webview.canGoBack) {
        [webview goBack];
    }
}

- (IBAction)forward:(id)sender {
    if (webview.canGoForward) {
        [webview goForward];
    }
}
@end
