
#import <Foundation/Foundation.h>

@interface RCCNotification : NSObject
+(void)showWithParams:(NSDictionary*)params resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject;
+(void)dismissWithParams:(NSDictionary*)params resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject;
@end
