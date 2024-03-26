#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import "RCTBridge.h"

@interface VlcViewManager : RCTViewManager
@end

@implementation VlcViewManager

RCT_EXPORT_MODULE(VlcView)

- (UIView *)view
{
  return [[UIView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(color, NSString)

@end
