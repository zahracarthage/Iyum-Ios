// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBNNRouteRefreshControllerOptions;
@protocol MBNNRouteRefreshObserver;

NS_SWIFT_NAME(RouteRefreshControllerInterface)
@protocol MBNNRouteRefreshControllerInterface
- (void)addObserverForObserver:(nonnull id<MBNNRouteRefreshObserver>)observer;
- (void)removeObserverForObserver:(nonnull id<MBNNRouteRefreshObserver>)observer;
- (void)removeAllObservers;
- (uint64_t)routeRefreshForOptions:(nonnull MBNNRouteRefreshControllerOptions *)options;
- (void)cancelForId:(uint64_t)id;
- (void)startForIntervalMs:(uint64_t)intervalMs
                   options:(nonnull MBNNRouteRefreshControllerOptions *)options;
- (void)stop;
@end
