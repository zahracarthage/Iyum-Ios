// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import <MapboxNavigationNative/MBNNRouterOrigin.h>

@class MBNNRerouteError;
@protocol MBNNRouteInterface;

NS_SWIFT_NAME(RerouteObserver)
@protocol MBNNRerouteObserver
- (void)onRerouteDetectedForRouteRequest:(nonnull NSString *)routeRequest;
- (void)onRerouteReceivedForRouteResponse:(nonnull NSString *)routeResponse
                             routeRequest:(nonnull NSString *)routeRequest
                                   origin:(MBNNRouterOrigin)origin;
- (void)onRerouteCancelled;
- (void)onRerouteFailedForError:(nonnull MBNNRerouteError *)error;
- (void)onSwitchToAlternativeForRoute:(nonnull id<MBNNRouteInterface>)route;
@end
