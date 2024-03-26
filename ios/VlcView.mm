#import "VlcView.h"
#import "react_native_vlc-Swift.h"

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
      
    NSURL * url = [[NSURL alloc] initWithString: @"https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"];
    swiftImpl = [[VlcViewSwift alloc] initWithUrl: url ];

    self.contentView = swiftImpl.view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<VlcViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<VlcViewProps const>(props);

//    if (oldViewProps.color != newViewProps.color) {
//        NSString * colorToConvert = [[NSString alloc] initWithUTF8String: newViewProps.color.c_str()];
//        [_view setBackgroundColor:[self hexStringToColor:colorToConvert]];
//    }

    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> VlcViewCls(void)
{
    return VlcView.class;
}

- hexStringToColor:(NSString *)stringToConvert
{
    NSString *noHashString = [stringToConvert stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *stringScanner = [NSScanner scannerWithString:noHashString];
    
    unsigned hex;
    if (![stringScanner scanHexInt:&hex]) return nil;
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1.0f];
}

@end
