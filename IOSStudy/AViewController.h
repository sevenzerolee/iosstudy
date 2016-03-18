//
//  AViewController.h
//  IOSStudy
//
//  Created by lkimac on 16/3/16.
//  Copyright © 2016年 lkimac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AViewController : UIViewController<UIWebViewDelegate, UISearchBarDelegate> {
//    UIWebView *webview;
    
    IBOutlet UISearchBar *search;
    IBOutlet UIWebView *webview;
    IBOutlet UIToolbar *toolbar;
    IBOutlet UIBarButtonItem *back;
    IBOutlet UIBarButtonItem *forward;
}
- (IBAction)back:(id)sender;
- (IBAction)forward:(id)sender;

@end
