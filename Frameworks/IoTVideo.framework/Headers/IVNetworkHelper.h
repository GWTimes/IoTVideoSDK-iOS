//
//  IVNetworkHelper.h
//  IoTVideo
//
//  Created by JonorZhang on 2020/6/3.
//  Copyright © 2020 Tencentcs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IVReachability.h"

#define IVNetworkReachability [IVNetworkHelper sharedInstance]
NS_ASSUME_NONNULL_BEGIN

@interface IVNetworkHelper : NSObject
/// 单例
+ (instancetype)sharedInstance;
/// 单例
@property (class, nonatomic, strong, readonly) IVNetworkHelper *sharedInstance;
@property (nonatomic, copy, readonly) NSString *currentWiFiSSID;

- (void)startMonitor;
- (BOOL)isReachable;
- (BOOL)isReachableViaWWAN;
- (BOOL)isReachableViaWiFi;
- (IVNetworkStatus)currentReachabilityStatus;
- (NSString *)currentReachabilityDesc;

@end

NS_ASSUME_NONNULL_END
