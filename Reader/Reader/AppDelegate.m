//
//  AppDelegate.m
//  Reader
//
//  Created by qianjn on 2017/1/24.
//  Copyright © 2017年 SF. All rights reserved.
//

#import "AppDelegate.h"
#import <Firebase/Firebase.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //Firebase
    [FIRApp configure];
    return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
