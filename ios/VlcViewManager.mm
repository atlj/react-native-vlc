#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import "RCTBridge.h"
#import "VlcView.h"

@interface VlcViewManager : RCTViewManager
@end

@implementation VlcViewManager

RCT_EXPORT_MODULE(VlcView)

RCT_EXPORT_VIEW_PROPERTY(src, NSString)
RCT_EXPORT_VIEW_PROPERTY(playing, BOOL)
RCT_EXPORT_VIEW_PROPERTY(onProgress, RCTDirectEventBlock)


@end
