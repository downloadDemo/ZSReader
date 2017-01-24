//
//  AppDelegate+Status.m
//  Reader
//
//  Created by qianjn on 2017/1/24.
//  Copyright © 2017年 SF. All rights reserved.
//

#import "AppDelegate+Status.h"
#import <FirebaseRemoteConfig/FirebaseRemoteConfig.h>
#import "YYCache.h"

@implementation AppDelegate (Status)


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [self getFireBaseRemoteConfig];
}

- (void)getFireBaseRemoteConfig
{
    [[FIRRemoteConfig remoteConfig] fetchWithExpirationDuration:5.0 completionHandler:^(FIRRemoteConfigFetchStatus status, NSError * _Nullable error) {
        if (status == FIRRemoteConfigFetchStatusSuccess && [[FIRRemoteConfig remoteConfig] activateFetched]) {
            NSArray *keys = [[FIRRemoteConfig remoteConfig] allKeysFromSource:FIRRemoteConfigSourceRemote
                                                                    namespace:FIRNamespaceGoogleMobilePlatform];
            [keys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                FIRRemoteConfigValue *value = [[FIRRemoteConfig remoteConfig] configValueForKey:obj];
                if ([value stringValue]) {
                    
                    NSLog(@"-----%@---%@", obj, value);
                    
                }
            }];
        }
    }];
}


@end
