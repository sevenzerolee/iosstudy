//
//  UserDefault.h
//  IOSStudy
//
//  Created by lkimac on 16/3/30.
//  Copyright © 2016年 lkimac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefault : NSObject

+ (void)setRootUrl:(NSString *)url;
+ (NSString *)getRootUrl;

+ (void)setUserName:(NSString *)username;
+ (NSString *)getUserName;

+ (void)setPasswd:(NSString *)passwd;
+ (NSString *)getPasswd;

+ (void)setPasswdMd5:(NSString *)passwd;
+ (NSString *)getPasswdMd5;

+ (void)setLoginType:(NSNumber *)loginType;
+ (NSNumber *)getLoginType;

+ (void)setUpdateDate:(NSString *) updateDate;
+ (NSString *)getUpdateDate;

+ (void)setUpdateFlag:(NSString *)updateFlag;
+ (NSNumber *)getUpdateFlag;

+ (void)setChecked:(NSNumber *)checked;
+ (NSString *)getChecked;

+ (void)setDeviceToken:(NSString *) deviceToken;
+ (NSString *)getDeviceToke;

+ (void)setJPushRegistrationId:(NSString *) jPushId;
+ (NSString *)getJPushRegistrationId;

@end
