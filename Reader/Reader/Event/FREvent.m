//
//  FREvent.m
//  Reader
//
//  Created by qianjn on 2017/1/24.
//  Copyright © 2017年 SF. All rights reserved.
//

#import "FREvent.h"
#import <Firebase/Firebase.h>

//https://firebase.google.cn/docs/analytics/ios/events

@implementation FREvent

+ (instancetype)getInstance
{
    static FREvent *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[FREvent alloc] init];
    });
    
    return _instance;
}

- (void)EventWithPage:(NSString *)page event:(NSString *)event param:(NSDictionary *)param
{
    NSMutableDictionary *eventParam = nil;
    if (param) {
        eventParam = [NSMutableDictionary dictionaryWithDictionary:param];
    } else {
        eventParam = [NSMutableDictionary dictionary];
        [eventParam setValue:event forKey:@"event"];
    }
    [FIRAnalytics logEventWithName:page
                        parameters:eventParam];
#ifdef DEBUG
    NSLog(@"event--page %@---%@", page ,eventParam);
#endif
    
}

@end
