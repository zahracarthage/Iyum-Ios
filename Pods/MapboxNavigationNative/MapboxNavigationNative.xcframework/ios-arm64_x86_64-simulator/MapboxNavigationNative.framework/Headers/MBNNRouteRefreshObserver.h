// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBNNRouteRefreshError;

NS_SWIFT_NAME(RouteRefreshObserver)
@protocol MBNNRouteRefreshObserver
- (void)onRouteRefreshAnnotationsUpdatedForId:(uint64_t)id
                         routeRefreshResponse:(nonnull NSString *)routeRefreshResponse
                                   routeIndex:(uint32_t)routeIndex
                                     legIndex:(uint32_t)legIndex;
- (void)onRouteRefreshCancelledForId:(uint64_t)id;
- (void)onRouteRefreshFailedForId:(uint64_t)id
                            error:(nonnull MBNNRouteRefreshError *)error;
@end
