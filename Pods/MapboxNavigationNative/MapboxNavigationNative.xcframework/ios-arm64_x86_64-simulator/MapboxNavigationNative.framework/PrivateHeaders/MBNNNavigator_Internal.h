// This file is generated and will be overwritten automatically.

#import <MapboxNavigationNative/MBNNNavigator.h>
#import <MapboxNavigationNative/MBNNSetAlternativeRoutesCallback_Internal.h>
#import <MapboxNavigationNative/MBNNSetRouteCallback_Internal.h>

@interface MBNNNavigator ()
- (nonnull instancetype)initWithConfig:(nonnull MBNNConfigHandle *)config
                                 cache:(nonnull MBNNCacheHandle *)cache
                       historyRecorder:(nullable MBNNHistoryRecorderHandle *)historyRecorder
                                router:(nullable id<MBNNRouterInterface>)router;

- (void)setRoutesForRoutes:(nullable MBNNRoutes *)routes
                  callback:(nonnull MBNNSetRouteCallback)callback __attribute__((deprecated("Use Navigator.setPrimaryRoute(RouteInterface) and Navigator.setAlternativeRoutes(array<RouteInterface>) instead")));
- (void)setPrimaryRouteForRoute:(nullable id<MBNNRouteInterface>)route
                       legIndex:(uint32_t)legIndex
                       callback:(nonnull MBNNSetRouteCallback)callback;
- (void)setAlternativeRoutesForRoutes:(nonnull NSArray<id<MBNNRouteInterface>> *)routes
                             callback:(nonnull MBNNSetAlternativeRoutesCallback)callback;
- (void)setRerouteControllerForController:(nonnull id<MBNNRerouteControllerInterface>)controller;
- (nonnull id<MBNNRerouteControllerInterface>)getRerouteController __attribute((ns_returns_retained));
- (nonnull id<MBNNRouteAlternativesControllerInterface>)getRouteAlternativesController __attribute((ns_returns_retained));
@end
