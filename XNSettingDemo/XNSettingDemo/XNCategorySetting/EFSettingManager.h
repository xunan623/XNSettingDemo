//
//  EFSettingManager.h
//  XNSettingDemo
//
//  Created by Dandre on 2018/4/23.
//  Copyright © 2018年 Dandre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EFSettingManager : NSObject

+ (instancetype)sharedInstance;

/**
 同步Settings.bundle信息
 */
- (void)synchPreference;

/** api接口地址 */
@property (nonatomic, copy) NSString *apiServerAddress;
/** h5接口地址 */
@property (nonatomic, copy) NSString *h5ServerAddress;

@end
