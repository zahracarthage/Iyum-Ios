// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import <MapboxNavigationNative/MBNNRouterOrigin.h>

@class MBNNRouteInfo;

NS_SWIFT_NAME(RouteInterface)
@protocol MBNNRouteInterface
/**
 * Unique route id.
 * For routes, whose directions response contains uuid: UUID + "#" + routeIndex
 * Example: d77PcddF8rhGUc3ORYGfcwcDfS_8QW6r1iXugXD0HOgmr9CWL8wn0g==#0
 * For routes, whose directions response nit contains uuid: "local@" + generateUuid() + "#" + routeIndex
 * Example: local@84438c3e-f608-47e9-88cc-cddf341d2fb1#0
 */
- (nonnull NSString *)getRouteId;
/** UUID from directions response object. This UUID can be used to refresh route. */
- (nonnull NSString *)getResponseUuid;
/**
 * Route index in routes array from direction's response.
 * This index can be used to refresh route and find route object in `getResponseJson().routes` JSON array.
 */
- (uint32_t)getRouteIndex;
/** This is a full directions route response. To find single route JSON in response use `getRouteIndex()`. */
- (nonnull NSString *)getResponseJson;
/** Directions route URI that used to request this route. */
- (nonnull NSString *)getRequestUri;
/** Router origin from router. Describes which kind of router presents response. */
- (MBNNRouterOrigin)getRouterOrigin;
/**
 * Get generic information about the route.
 * Example: get all route alerts on the route
 */
- (nonnull MBNNRouteInfo *)getRouteInfo;
@end
