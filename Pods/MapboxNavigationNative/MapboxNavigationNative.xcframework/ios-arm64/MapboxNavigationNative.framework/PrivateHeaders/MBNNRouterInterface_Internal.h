// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import <MapboxNavigationNative/MBNNRouterCallback_Internal.h>
#import <MapboxNavigationNative/MBNNRouterRefreshCallback_Internal.h>

@class MBNNRouteRefreshOptions;

NS_SWIFT_NAME(RouterInterface)
@protocol MBNNRouterInterface
- (uint64_t)getRouteForDirectionsUri:(nonnull NSString *)directionsUri
                            callback:(nonnull MBNNRouterCallback)callback;
- (uint64_t)getRouteRefreshForOptions:(nonnull MBNNRouteRefreshOptions *)options
                             callback:(nonnull MBNNRouterRefreshCallback)callback;
/**
 * Cancels the `getRoute` request using token.
 *
 * @see `getRoute`. Cancels router request.
 */
- (void)cancelRouteRequestForToken:(uint64_t)token;
/**
 * Cancels the `getRouteRefresh` request using token.
 *
 * @see `getRouteRefresh`. Cancels router request.
 */
- (void)cancelRouteRefreshRequestForToken:(uint64_t)token;
/** Interrupts all in-progress requests. */
- (void)cancelAll;
@end
