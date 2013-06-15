//
//  EMKAppDelegate.m
//  Peek-A-Boo
//
//  Created by Erik on 15.06.13.
//  Copyright (c) 2013 Kalaxy. All rights reserved.
//

#import "EMKAppDelegate.h"
#import "EMKBooViewController.h"

@implementation EMKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    EMKBooViewController *rootViewController = [[EMKBooViewController alloc] init];
    self.window.rootViewController = rootViewController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
   
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

@end
