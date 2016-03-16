//
//  CAlertView.h
//  IOSStudy
//
//  Created by lkimac on 16/3/15.
//  Copyright © 2016年 lkimac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CAlertView;
@protocol CAlertViewDelegate <NSObject>
@optional
-(void)didRotationToInterfaceOrientation:(BOOL)Landscape view:(UIView*)view alertView:(CAlertView*)aletView;
@end

@interface CAlertView : UIView{
@private
    BOOL   _beShow;
    UIInterfaceOrientation _orientation;
    BOOL   _bePresented;
}
@property(nonatomic,retain)UIView*  backGroundView;
@property(nonatomic,retain)UIView*  contentView;
@property(nonatomic, readonly)BOOL  visible;
@property(nonatomic,assign)id<CAlertViewDelegate> delegate;

- (id)initWithView:(UIView*)view;
-(void)show;
-(void)dismissAlertViewWithAnimated:(BOOL)animated;

@end
