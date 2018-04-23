//
//  EFSettingManager.m
//  XNSettingDemo
//
//  Created by Dandre on 2018/4/23.
//  Copyright © 2018年 Dandre. All rights reserved.
//

#import "EFSettingManager.h"

@interface EFSettingManager ()

@property (nonatomic, copy) NSString *path;

@end

@implementation EFSettingManager

static NSString * const EFSettings              = @"PreferenceSpecifiers";      // Settings根目录
static NSString * const EFSettingsDValue        = @"DefaultValue";              // 默认值
static NSString * const EFAPIServerAddress      = @"APIServerAddress";          // apiKey
static NSString * const EFH5ServerAddress       = @"H5ServerAddress";           // h5Key

+ (instancetype)sharedInstance {
    static EFSettingManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)synchPreference {
    NSString *settingsBundle = [self settingsPath];
    
    NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:[settingsBundle
                                                                         stringByAppendingPathComponent:@"Root.plist"]];
    
    NSArray *preferences = [settings objectForKey:EFSettings];
    
    NSMutableDictionary *defaultsToRegister = [[NSMutableDictionary alloc] initWithCapacity:[preferences count]];

    for(NSDictionary *subDict in preferences)
    {
        NSString *key = [subDict objectForKey:@"Key"];
        if(key)
        {
            [defaultsToRegister setObject:[subDict objectForKey:EFSettingsDValue] forKey:key];
        }
    }
    [[NSUserDefaults standardUserDefaults] setObject:defaultsToRegister forKey:EFSettings];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)apiServerAddress {
    return [self getTextFiledWith:EFAPIServerAddress];
}

- (NSString *)h5ServerAddress {
    return [self getTextFiledWith:EFH5ServerAddress];
}

- (NSString *)settingsPath {
    NSString *settingsBundle = [[NSBundle mainBundle] pathForResource:@"Settings"
                                                               ofType:@"bundle"];
    if(!settingsBundle) {
        NSLog(@"找不到Settings.bundle文件");
        return nil;
    }
    return settingsBundle;
}

- (NSString *)getTextFiledWith:(NSString *)keyId {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *defaultValue = [defaults objectForKey:keyId];
    return defaultValue;
}

@end
