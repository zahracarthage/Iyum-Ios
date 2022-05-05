// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import <MapboxNavigationNative/MBNNChangeLegCallback.h>
#import <MapboxNavigationNative/MBNNGetBannerInstructionCallback.h>
#import <MapboxNavigationNative/MBNNResetCallback.h>
#import <MapboxNavigationNative/MBNNUpdateAnnotationsCallback.h>
#import <MapboxNavigationNative/MBNNUpdateLocationCallback.h>

@class MBNNCacheHandle;
@class MBNNConfigHandle;
@class MBNNElectronicHorizonOptions;
@class MBNNFixLocation;
@class MBNNHistoryRecorderHandle;
@class MBNNPredictiveCacheController;
@class MBNNPredictiveCacheControllerOptions;
@class MBNNPredictiveLocationTrackerOptions;
@class MBNNRoadObjectsStore;
@class MBNNRoutes;
@class MBXTileStore;
@class MBXTilesetDescriptor;
@protocol MBNNElectronicHorizonObserver;
@protocol MBNNExperimental;
@protocol MBNNFallbackVersionsObserver;
@protocol MBNNNavigatorObserver;
@protocol MBNNRerouteControllerInterface;
@protocol MBNNRerouteDetectorInterface;
@protocol MBNNRerouteObserver;
@protocol MBNNRouteAlternativesControllerInterface;
@protocol MBNNRouteInterface;
@protocol MBNNRouteRefreshControllerInterface;
@protocol MBNNRouterInterface;

NS_SWIFT_NAME(Navigator)
__attribute__((visibility ("default")))
@interface MBNNNavigator : NSObject

// This class provides custom init which should be called
- (nonnull instancetype)init NS_UNAVAILABLE;

// This class provides custom init which should be called
+ (nonnull instancetype)new NS_UNAVAILABLE;

/** Obtain config object that was used for Navigator construction */
- (nonnull MBNNConfigHandle *)config __attribute((ns_returns_retained));
/**
 * Shuts down Navigator instance, so it frees resources.
 * This Navigator instance should not be used after shutdown call.
 */
- (void)shutdown;
/**
 * Sets the `FallbackVersionsObserver` instance for notifications about fallback (available offline) versions found.
 * In order to remove observer just call `setFallbackVersionsObserver(null)`.
 */
- (void)setFallbackVersionsObserverForObserver:(nullable id<MBNNFallbackVersionsObserver>)observer;
/**
 * After setting observer `getStatus` shouldn't be called,
 * but `Navigator` object will start calling `NavigatorObserver.onStatus` as soon as at least one raw location is received.
 */
- (void)addObserverForObserver:(nonnull id<MBNNNavigatorObserver>)observer;
- (void)removeObserverForObserver:(nonnull id<MBNNNavigatorObserver>)observer;
- (void)addRerouteObserverForObserver:(nonnull id<MBNNRerouteObserver>)observer;
- (void)removeRerouteObserverForObserver:(nonnull id<MBNNRerouteObserver>)observer;
/**
 * Asynchronously updates annotations for primary route so that subsequent calls to getStatus will
 * reflect the most current annotations for the route. Also apply updates to the current route and provides result in callback.
 * The callback is scheduled using the `common::Scheduler` of the thread calling the `Navigator` constructor.
 *
 * @param  routeRefreshResponse  A string containing the json repesented route refresh response from `RouterInterface`
 * @param  leg    Which leg to apply the annotation update to
 * @param  callback Callback which is called when the async operation is completed
 */
- (void)updateAnnotationsForRouteRefreshResponse:(nonnull NSString *)routeRefreshResponse
                                             leg:(uint32_t)leg
                                        callback:(nonnull MBNNUpdateAnnotationsCallback)callback;
/**
 * Asynchronously updates annotations so that subsequent calls to getStatus will
 * reflect the most current annotations for the route. Also apply updates to the current route and provides result in callback.
 * The callback is scheduled using the `common::Scheduler` of the thread calling the `Navigator` constructor.
 *
 * @param  routeRefreshResponse  A string containing the json repesented route refresh response from `RouterInterface`
 * @param  routeId  Which route to apply the annotation update to
 * @param  leg      Which leg to apply the annotation update to
 * @param  callback Callback which is called when the async operation is completed
 */
- (void)updateAnnotationsForRouteRefreshResponse:(nonnull NSString *)routeRefreshResponse
                                         routeId:(nonnull NSString *)routeId
                                             leg:(uint32_t)leg
                                        callback:(nonnull MBNNUpdateAnnotationsCallback)callback;
/**
 * Asynchronously passes in the current fix location of the user.
 * The callback is scheduled using the `common::Scheduler` of the thread calling the `Navigator` constructor.
 *
 * @param  fix  The current fix location of user.
 * @param  callback Callback which is called when the async operation is completed
 */
- (void)updateLocationForFixLocation:(nonnull MBNNFixLocation *)fixLocation
                            callback:(nonnull MBNNUpdateLocationCallback)callback;
/**
 * Asynchronously gets the current banner instruction
 * The callback is scheduled using the `common::Scheduler` of the thread calling the `Navigator` constructor.
 * @param  callback Callback which is called when the async operation is completed
 */
- (void)getBannerInstructionForCallback:(nonnull MBNNGetBannerInstructionCallback)callback __attribute__((deprecated("This method should not be used anymore. Banner and Voice instructions are returned in NavigationStatus for all route states except RouteState::Invalid and RouteState::OffRoute.")));
/**
 * Asynchronously sets leg of the already loaded directions
 * The callback is scheduled using the `common::Scheduler` of the thread calling the `Navigator` constructor.
 *
 * @param leg    new leg index
 * @param  callback Callback which is called when the async operation is completed
 */
- (void)changeLegForLeg:(uint32_t)leg
               callback:(nonnull MBNNChangeLegCallback)callback;
/** Set an observer and the configuration for the EH. */
- (void)setElectronicHorizonObserverForObserver:(nullable id<MBNNElectronicHorizonObserver>)observer;
/** Sets electronic horizon options. Pass null to reset to defaults. */
- (void)setElectronicHorizonOptionsForOptions:(nullable MBNNElectronicHorizonOptions *)options;
/** Returns road object store */
- (nonnull MBNNRoadObjectsStore *)roadObjectStore __attribute((ns_returns_retained));
/**
 * Resets ride session. This method exposes recreation of ride session, which is
 * needed for restarting of simulation.
 * Please call it before significant change of location, e.g. when restarting
 * navigation simulation, or before resetting location to not real (simulated)
 * position without recreation of navigator.
 */
- (void)resetRideSession __attribute__((deprecated("Use Navigator#reset instead")));
/**
 * Resets internal state of Navigator, useful in case if we use Navigator for replays or simulation,
 * when timestamps can decrease and locations can have unexpected significant changes.
 * Please call it before significant change of location, e.g. when restarting
 * navigation simulation, or before resetting location to not real (simulated)
 * position without recreation of navigator.
 */
- (void)resetForCallback:(nonnull MBNNResetCallback)callback;
/**
 * Creates predictive cache controller to populate the specified tile store instance
 * with the tiles described by the specified tileset descriptors.
 *
 * @param tileStore               a tile store that should be populated with tiles
 * @param descriptors             a list of tileset descriptors
 * @param locationTrackerOptions  options to configure what tiles should be loaded for current location and route
 *
 * @return a PredictiveCacheController object
 */
- (nonnull MBNNPredictiveCacheController *)createPredictiveCacheControllerForTileStore:(nonnull MBXTileStore *)tileStore
                                                                           descriptors:(nonnull NSArray<MBXTilesetDescriptor *> *)descriptors
                                                                locationTrackerOptions:(nonnull MBNNPredictiveLocationTrackerOptions *)locationTrackerOptions __attribute((ns_returns_retained));
/**
 * @param tileStore               a tile store that should be populated with tiles
 * @param cacheOptions            cache options such as dataset and version of tiles
 * @param locationTrackerOptions  options to configure what tiles should be loaded for current location and route
 *
 * @return a PredictiveCacheController object
 */
- (nonnull MBNNPredictiveCacheController *)createPredictiveCacheControllerForTileStore:(nonnull MBXTileStore *)tileStore
                                                                          cacheOptions:(nonnull MBNNPredictiveCacheControllerOptions *)cacheOptions
                                                                locationTrackerOptions:(nonnull MBNNPredictiveLocationTrackerOptions *)locationTrackerOptions __attribute((ns_returns_retained));
/**
 * Creates predictive cache controller to populate inner tile store instance of this navigator.
 *
 * @param cacheOptions            cache options such as dataset and version of tiles
 * @param locationTrackerOptions  options to configure what tiles should be loaded for current location and route
 *
 * @return a PredictiveCacheController object
 */
- (nonnull MBNNPredictiveCacheController *)createPredictiveCacheControllerForCacheOptions:(nonnull MBNNPredictiveCacheControllerOptions *)cacheOptions
                                                                   locationTrackerOptions:(nonnull MBNNPredictiveLocationTrackerOptions *)locationTrackerOptions __attribute((ns_returns_retained));
/**
 * Creates predictive cache controller to populate inner tile store instance of this navigator
 * and take dataset and version of tiles from Navigator's config.
 *
 * @param locationTrackerOptions  options to configure what tiles should be loaded for current location and route
 *
 * @return a PredictiveCacheController object
 */
- (nonnull MBNNPredictiveCacheController *)createPredictiveCacheControllerForLocationTrackerOptions:(nonnull MBNNPredictiveLocationTrackerOptions *)locationTrackerOptions __attribute((ns_returns_retained));
- (nonnull id<MBNNRerouteDetectorInterface>)getRerouteDetector __attribute((ns_returns_retained));
- (nonnull id<MBNNRouteRefreshControllerInterface>)getRouteRefreshController __attribute((ns_returns_retained));
/**
 * Returns interface implementing experimental APIs
 * Caller must guarantee `Navigator` instance is alive when calling any methods of returned instance
 */
- (nonnull id<MBNNExperimental>)getExperimental __attribute((ns_returns_retained));
/** Pause navigator. We will no longer receive NavigationStatus while there is a pause. */
- (void)pause;
/** Resume navigator. Remove pause, and start receiving NavigationStatus'es */
- (void)resume;

@end
