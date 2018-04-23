//
//  ViewController.m
//  XNSettingDemo
//
//  Created by Dandre on 2018/4/23.
//  Copyright © 2018年 Dandre. All rights reserved.
//

#import "ViewController.h"
#import "EFSettingManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%@", [EFSettingManager sharedInstance].apiServerAddress);
    NSLog(@"%@", [EFSettingManager sharedInstance].h5ServerAddress);

}

@end
