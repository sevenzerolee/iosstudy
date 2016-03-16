//
//  CustomAlertView.m
//  IOSStudy
//
//  Created by lkimac on 16/3/15.
//  Copyright © 2016年 lkimac. All rights reserved.
//

#import "CustomAlertView.h"

@implementation CustomAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//- (id)init {
//    self = [super init];
//    if (self) {
//        //
//    }
//    
//    return self;
//}

- (void)layoutSubviews{//这个是重点！！重新定义UIAlertView中的各种控件，包括UILabel，UIButton等
    
    for (UIView *v in self.subviews) {//遍历UIAlertView中的所有控件（UIView），再将它们重新设置
        if ([v isKindOfClass:[UILabel class]]) {//设置Label
            UILabel *label = (UILabel *)v;
            NSLog(@"label %@", [label text]);
            if ([label.text isEqualToString:self.title]) {
                label.font = [UIFont boldSystemFontOfSize:40];
                label.numberOfLines = 0;
                label.lineBreakMode = UILineBreakModeWordWrap;
                label.textColor = [UIColor redColor];
                label.backgroundColor = [UIColor clearColor];
                label.textAlignment = UITextAlignmentCenter;
                label.shadowColor = [UIColor blackColor];
                label.shadowOffset = CGSizeMake(0, -1);//设置阴影
                [label sizeToFit];//文字大小自动适应
                label.center = CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.2);
            }else{
                label.font = [UIFont boldSystemFontOfSize:20];
                label.numberOfLines = 0;
                label.lineBreakMode = UILineBreakModeWordWrap;
                label.textColor = [UIColor yellowColor];
                label.backgroundColor = [UIColor clearColor];
                label.textAlignment = UITextAlignmentCenter;
                label.shadowColor = [UIColor blackColor];
                label.shadowOffset = CGSizeMake(0, -1);
                label.center = CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.3);
            }
        }
        if ([v isKindOfClass:NSClassFromString(@"UIAlertButton")]) {//设置Button
            UIButton *button = (UIButton *)v;
            NSLog(@"button");
            UIImage *image = nil;
            if (button.tag == 1) {//给button的标签赋一个值，以便区分左右两个Button，对其进行更详细的设置。
                image = [UIImage imageNamed:[NSString stringWithFormat:@"alert-%@-button.png", @"red"]];
            }else{
                image = [UIImage imageNamed:[NSString stringWithFormat:@"alert-%@-button.png", @"black"]];
            }
            image = [image stretchableImageWithLeftCapWidth:(int)(image.size.width+1)>>1 topCapHeight:0];//这句话的作用是：将image图片的内容拉伸，而边角不拉伸。>>是右移运算符，感兴趣的同学可以去百度一下，这里不需要知道原理，了解作用就行了
            button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
            button.titleLabel.minimumFontSize = 10;
            button.titleLabel.textAlignment = UITextAlignmentCenter;
            button.titleLabel.shadowOffset = CGSizeMake(0, -1);
            button.backgroundColor = [UIColor clearColor];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            if (button.tag == 1)
                button.center = CGPointMake(self.bounds.size.width*0.25, self.bounds.size.height*0.75);
            else
                button.center = CGPointMake(self.bounds.size.width*0.75, self.bounds.size.height*0.5);
            //            [button setTitleColor:kAlertViewButtonTextColor forState:UIControlStateNormal];
            [button setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIImageView *pic = [[UIImageView alloc]initWithFrame:CGRectMake(230, 45, 60, 60)];
    [pic setImage:[UIImage imageNamed:@"LittleWhitePig.png"]];
    [self addSubview:pic];
//    [pic release];
}

- (void)show
{
    [super show];
    self.bounds = CGRectMake(0, 100, 320, 300);//更改整个UIAlertView的框架
}

@end
