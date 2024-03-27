#import "ReactNativeVLC.h"
#import "ReactNativeVLC-Swift.h"

#import <react/renderer/components/RNVlcViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNVlcViewSpec/EventEmitters.h>
#import <react/renderer/components/RNVlcViewSpec/Props.h>
#import <react/renderer/components/RNVlcViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@interface VlcView () <RCTVlcViewViewProtocol>

@end

@implementation VlcView {
    VlcViewSwift * swiftImpl;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<VlcViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const VlcViewProps>();
    _props = defaultProps;
    swiftImpl = [[VlcViewSwift alloc] init];

    self.contentView = swiftImpl.view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<VlcViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<VlcViewProps const>(props);
    
    if (oldViewProps.src != newViewProps.src) {
        NSString * srcString = [NSString stringWithUTF8String:newViewProps.src.c_str()];
        NSURL * url = [[NSURL alloc] initWithString: srcString];
        [swiftImpl setSrc: url];
    }
    
    if (oldViewProps.playing != newViewProps.playing) {
        [swiftImpl setPlaying: newViewProps.playing];
    }

    [super updateProps:props oldProps:oldProps];
}

- (void)updateEventEmitter:(const facebook::react::EventEmitter::Shared &)eventEmitter {
    const auto &emitter = *std::static_pointer_cast<VlcViewEventEmitter const>(eventEmitter);
    
    swiftImpl.onProgress = ^(ProgressEvent* progressEvent) {
        VlcViewEventEmitter::OnProgress event;
        event.progress = progressEvent->progress;
        event.duration = progressEvent->duration;
        emitter.onProgress(event);
    };
    
    [super updateEventEmitter: eventEmitter];
}


Class<RCTComponentViewProtocol> VlcViewCls(void)
{
    return VlcView.class;
}

@end
