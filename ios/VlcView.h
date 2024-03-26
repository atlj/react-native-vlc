// This guard prevent this file to be compiled in the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED

#import <React/RCTViewComponentView.h>
#import <UIKit/UIKit.h>
#import <MobileVLCKit/VLCMedia.h>

#ifndef VlcViewNativeComponent_h
#define VlcViewNativeComponent_h

NS_ASSUME_NONNULL_BEGIN

@interface VlcView : RCTViewComponentView
@end

NS_ASSUME_NONNULL_END

#endif /* VlcViewNativeComponent_h */
#endif /* RCT_NEW_ARCH_ENABLED */
