//
//  AppDelegate.m
//  XNSettingDemo
//
//  Created by Dandre on 2018/4/23.
//  Copyright © 2018年 Dandre. All rights reserved.
//

#import "AppDelegate.h"
#import "EFSettingManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[EFSettingManager sharedInstance] synchPreference];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[EFSettingManager sharedInstance] synchPreference];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[EFSettingManager sharedInstance] synchPreference];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
