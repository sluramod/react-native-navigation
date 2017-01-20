#import "RNNCustomNavButtonManager.h"

static NSMutableDictionary *gCustomButtonsRegistry = nil;

@implementation RNNCustomNavButton


@end

@implementation RNNCustomNavButtonManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    return [[RNNCustomNavButton alloc] init];
}

RCT_CUSTOM_VIEW_PROPERTY(buttonId, NSString, RNNCustomNavButton)
{
    view.buttonId = [RCTConvert NSString:json];

    if(view.buttonId.length > 0)
    {
        if(gCustomButtonsRegistry == nil)
        {
            gCustomButtonsRegistry = [@{} mutableCopy];
        }
        gCustomButtonsRegistry[view.buttonId] = view;
    }
}

+(UIView*)buttonViewWithId:(NSString*)buttonId
{
    if(buttonId.length <= 0)
    {
        return nil;
    }

    UIView *button = gCustomButtonsRegistry[buttonId];
    [button removeFromSuperview];
    button.frame = CGRectMake(0, 0, button.frame.size.width, button.frame.size.height);
    return button;
}

RCT_EXPORT_METHOD(destroyButtonWithId:(NSString*)buttonId) {
    if(buttonId && gCustomButtonsRegistry[buttonId])
    {
        NSLog(@"custom navbar button with id '%@' is destroyed", buttonId);
        gCustomButtonsRegistry[buttonId] = nil;
    }
}

@end