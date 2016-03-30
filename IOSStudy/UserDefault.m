//
//  UserDefault.m
//  IOSStudy
//
//  Created by lkimac on 16/3/30.
//  Copyright © 2016年 lkimac. All rights reserved.
//

#import "UserDefault.h"
#import "Constants.h"

@implementation UserDefault

+ (void)setObjectForKey:(NSObject *)value :(NSString *)key {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:value forKey:key];
    [ud synchronize];
}

+ (NSString *)getObjectForKey:(NSString *)key {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *value = [ud objectForKey:key];
    if (nil != value) {
        return value;
    }
    
    return nil;
}

+ (NSNumber *)getNumberForKey:(NSString *)key {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSNumber *value = [ud objectForKey:key];
    if (nil != value) {
        return value;
    }
    
    return nil;
}


+ (void)setRootUrl:(NSString *)url {
    [UserDefault setObjectForKey:url :@"url_preference"];
}

+ (NSString *)getRootUrl {
    return [UserDefault getObjectForKey:@"url_preference"];
}


+ (void)setUserName:(NSString *)username {
    [UserDefault setObjectForKey:username :@"user_preference"];
}

+ (NSString *)getUserName {
    return [UserDefault getObjectForKey:@"user_preference"];
}


+ (void)setPasswd:(NSString *)passwd {
    [UserDefault setObjectForKey:passwd :@"password_preference"];
}

+ (NSString *)getPasswd {
    return [UserDefault getObjectForKey:@"password_preference"];
}

+ (void)setPasswdMd5:(NSString *)passwdMd5 {
    [UserDefault setObjectForKey:passwdMd5 :@"password_md5_preference"];
}

+ (NSString *)getPasswdMd5 {
    return [UserDefault getObjectForKey:@"password_md5_preference"];
}









+ (void)setLoginType:(NSNumber *)loginType {
    [UserDefault setObjectForKey:loginType :@"login_type"];
}

+ (NSNumber *)getLoginType {
    return [UserDefault getNumberForKey:@"login_type"];
}


+ (void)setUpdateDate:(NSString *)updateDate {
    [UserDefault setObjectForKey:updateDate :@"update_date"];
}

+ (NSString *)getUpdateDate {
    return [UserDefault getObjectForKey:@"update_date"];
}


+ (void)setUpdateFlag:(NSString *)updateFlag {
    [UserDefault setObjectForKey:updateFlag :@"update_flag"];
}

+ (NSNumber *)getUpdateFlag {
    return [UserDefault getNumberForKey:@"update_flag"];
}


+ (void)setChecked:(NSNumber *)checked {
    [UserDefault setObjectForKey:checked :@"checked"];
}

+ (NSString *)getChecked {
    return [UserDefault getObjectForKey:@"checked"];
}

+ (void)setDeviceToken:(NSString *)deviceToken {
    [UserDefault setObjectForKey:deviceToken :@"device_token"];
}

+ (NSString *)getDeviceToke {
    return [UserDefault getObjectForKey:@"device_token"];
}


+ (void) setJPushRegistrationId:(NSString *)jPushId {
    [UserDefault setObjectForKey:jPushId :@"jpush_registration_id"];
}

+ (NSString *) getJPushRegistrationId {
    return [UserDefault getObjectForKey:@"jpush_registration_id"];
}

@end
