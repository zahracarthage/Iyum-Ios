// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBNNShield;

NS_SWIFT_NAME(Road)
__attribute__((visibility ("default")))
@interface MBNNRoad : NSObject

// This class provides custom init which should be called
- (nonnull instancetype)init NS_UNAVAILABLE;

// This class provides custom init which should be called
+ (nonnull instancetype)new NS_UNAVAILABLE;

- (nonnull instancetype)initWithText:(nonnull NSString *)text
                        imageBaseUrl:(nullable NSString *)imageBaseUrl
                              shield:(nullable MBNNShield *)shield;

@property (nonatomic, readonly, nonnull, copy) NSString *text;
@property (nonatomic, readonly, nullable, copy) NSString *imageBaseUrl;
@property (nonatomic, readonly, nullable) MBNNShield *shield;

- (BOOL)isEqualToRoad:(nonnull MBNNRoad *)other;

@end
