//
//  RCNConfigRealtime.m
//  FirebaseRemoteConfig
//
//  Created by Quan Pham on 5/13/22.
//

#import <Foundation/Foundation.h>
#import "RCNConfigRealtime.h"

NSInteger listenerCount = 1;

@implementation FIRConfigUpdateListenerRegistration {
    RCNConfigRealtime *_realtimeClient;
    NSString *listenerName;
}

- (instancetype) initWithClass: (RCNConfigRealtime *)realtimeClient
                  listenerName: (NSString *)listenerName {
    self = [super init];
    if (self) {
        _realtimeClient = realtimeClient;
        listenerName = listenerName;
    }
    return self;
}

- (void)remove {
    [self-> _realtimeClient removeConfigUpdateListener: listenerName];
}

@end

@implementation RCNConfigRealtime {
    __strong NSMutableDictionary *_listeners;
}

-(instancetype) initWithClass {
    self = [super init];
    if (self) {
        _listeners = [NSMutableDictionary alloc];
    }
    
    return self;
}

-(void)beginRealtime {
    
}

-(void)pauseRealtime {
    
}

-(FIRConfigUpdateListenerRegistration *)addConfigUpdateListener: (FIRConfigUpdateCompletion)completionHandler {
    NSString *listenerName = [@(listenerCount) stringValue];
    [_listeners setValue:completionHandler forKey:listenerName];
    listenerCount++;
    [self beginRealtime];
    return [[FIRConfigUpdateListenerRegistration alloc] initWithClass: self listenerName:listenerName];
}

-(void)removeConfigUpdateListener: (NSString *)listenerName {
    [self->_listeners removeObjectForKey:listenerName];
    if ([self->_listeners count] == 0) {
        [self pauseRealtime];
    }
}

@end
