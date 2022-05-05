// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import <MapboxNavigationNative/MBNNOpenLRStandard.h>

NS_SWIFT_NAME(OpenLR)
__attribute__((visibility ("default")))
@interface MBNNOpenLR : NSObject

// This class provides custom init which should be called
- (nonnull instancetype)init NS_UNAVAILABLE;

// This class provides custom init which should be called
+ (nonnull instancetype)new NS_UNAVAILABLE;

- (nonnull instancetype)initWithStandard:(MBNNOpenLRStandard)standard
                           base64Encoded:(nonnull NSString *)base64Encoded;

@property (nonatomic, readonly) MBNNOpenLRStandard standard;
@property (nonatomic, readonly, nonnull, copy) NSString *base64Encoded;

@end
