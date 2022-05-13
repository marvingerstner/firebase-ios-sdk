//
//  RCNConfigRealtime.h
//  Pods
//
//  Created by Quan Pham on 5/13/22.
//

#ifndef RCNConfigRealtime_h
#define RCNConfigRealtime_h

#import <Foundation/Foundation.h>
#import "FirebaseRemoteConfig/Sources/Public/FirebaseRemoteConfig/FIRRemoteConfig.h"
#import <UIKit/UIKit.h>

@interface RCNConfigRealtime : UIViewController <NSURLSessionDataDelegate>

@property(strong, atomic) NSMutableDictionary<NSString *, id> * _Nonnull _listeners;

- (FIRConfigUpdateListenerRegistration *_Nonnull)addConfigUpdateListener: (FIRConfigUpdateCompletion _Nonnull) completionHandler;
- (void)removeConfigUpdateListener: (NSString *_Nonnull)listenerName;

@end

#endif /* RCNConfigRealtime_h */
