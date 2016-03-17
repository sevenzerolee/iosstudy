//
//  MenuViewController.h
//  IOSStudy
//
//  Created by lkimac on 16/3/16.
//  Copyright © 2016年 lkimac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController {
    
    IBOutlet UILabel *sTitle;
    IBOutlet UIButton *bgBtn;
    
}

- (IBAction)hide:(id)sender;
- (IBAction)cancel:(id)sender;

@end
