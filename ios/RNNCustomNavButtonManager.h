#import <UIKit/UIKit.h>
#import <React/RCTViewManager.h>

@interface RNNCustomNavButton : UIView
@property (nonatomic, strong) NSString *buttonId;

@end

@interface RNNCustomNavButtonManager : RCTViewManager
+(UIView*)buttonViewWithId:(NSString*)buttonId;
+(void)destroyButtonWithId:(NSString*)buttonId;
@end