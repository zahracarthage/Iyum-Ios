// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(Routes)
__attribute__((visibility ("default")))
__attribute__((deprecated))
@interface MBNNRoutes : NSObject

// This class provides custom init which should be called
- (nonnull instancetype)init NS_UNAVAILABLE;

// This class provides custom init which should be called
+ (nonnull instancetype)new NS_UNAVAILABLE;

- (nonnull instancetype)initWithRoutesResponse:(nonnull NSString *)routesResponse
                                    routeIndex:(uint32_t)routeIndex
                                      legIndex:(uint32_t)legIndex
                                 routesRequest:(nonnull NSString *)routesRequest;

/** Directions API response */
@property (nonatomic, readonly, nonnull, copy) NSString *routesResponse;

/** Current route index in routes object represented by `routeResponse`, sets which route to follow */
@property (nonatomic, readonly) uint32_t routeIndex;

/** Current route leg index, sets leg to follow */
@property (nonatomic, readonly) uint32_t legIndex;

/** URI used for route request. This URI used to extract Directions API parameters for re-routes and alternatives routes. */
@property (nonatomic, readonly, nonnull, copy) NSString *routesRequest;


@end
