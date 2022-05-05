// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import <MapboxNavigationNative/MBNNRouteState.h>

@class MBNNActiveGuidanceInfo;
@class MBNNBannerInstruction;
@class MBNNFixLocation;
@class MBNNMapMatcherOutput;
@class MBNNRoad;
@class MBNNSpeedLimit;
@class MBNNUpcomingRouteAlert;
@class MBNNVoiceInstruction;

NS_SWIFT_NAME(NavigationStatus)
__attribute__((visibility ("default")))
@interface MBNNNavigationStatus : NSObject

// This class provides custom init which should be called
- (nonnull instancetype)init NS_UNAVAILABLE;

// This class provides custom init which should be called
+ (nonnull instancetype)new NS_UNAVAILABLE;

- (nonnull instancetype)initWithRouteState:(MBNNRouteState)routeState
                 locatedAlternativeRouteId:(nullable NSString *)locatedAlternativeRouteId
                                     stale:(BOOL)stale
                                  location:(nonnull MBNNFixLocation *)location
                                routeIndex:(uint32_t)routeIndex
                                  legIndex:(uint32_t)legIndex
                                 stepIndex:(uint32_t)stepIndex
                                isFallback:(BOOL)isFallback
                                  inTunnel:(BOOL)inTunnel
                                 predicted:(NSTimeInterval)predicted
                                shapeIndex:(uint32_t)shapeIndex
                         intersectionIndex:(uint32_t)intersectionIndex
                                     roads:(nonnull NSArray<MBNNRoad *> *)roads
                          voiceInstruction:(nullable MBNNVoiceInstruction *)voiceInstruction
                         bannerInstruction:(nullable MBNNBannerInstruction *)bannerInstruction
                                speedLimit:(nullable MBNNSpeedLimit *)speedLimit
                                 keyPoints:(nonnull NSArray<MBNNFixLocation *> *)keyPoints
                          mapMatcherOutput:(nonnull MBNNMapMatcherOutput *)mapMatcherOutput
                              offRoadProba:(float)offRoadProba
                        activeGuidanceInfo:(nullable MBNNActiveGuidanceInfo *)activeGuidanceInfo
                       upcomingRouteAlerts:(nonnull NSArray<MBNNUpcomingRouteAlert *> *)upcomingRouteAlerts
                         nextWaypointIndex:(uint32_t)nextWaypointIndex
                                     layer:(nullable NSNumber *)layer;

@property (nonatomic, readonly) MBNNRouteState routeState;
/**
 * Id of alternative route that we matched. This field calculated in OffRoute `routeState`.
 *  `nullopt` for non-OffRoute `routeState` or if no one alternative route matches.
 */
@property (nonatomic, readonly, nullable, copy) NSString *locatedAlternativeRouteId;

/**
 * We didn't have location updates for too much time.
 * This can be handled as "grey puck" or "No GPS" on client side.
 */
@property (nonatomic, readonly, getter=isStale) BOOL stale;

/** enhanced location */
@property (nonatomic, readonly, nonnull) MBNNFixLocation *location;

/** index of route */
@property (nonatomic, readonly) uint32_t routeIndex;

/** index of current leg in route bounds */
@property (nonatomic, readonly) uint32_t legIndex;

/** index of current step in leg bounds */
@property (nonatomic, readonly) uint32_t stepIndex;

/**
 * `true` if status was produced in "fallback" mode, i.e. navigation tiles were not used
 * (e.g. they are not available), usually it means worse user experience
 */
@property (nonatomic, readonly, getter=isIsFallback) BOOL isFallback;

/** is current location belongs to tunnel */
@property (nonatomic, readonly, getter=isInTunnel) BOOL inTunnel;

/** "prediction" time, i.e. duration between this status and the latest location update */
@property (nonatomic, readonly) NSTimeInterval predicted;

/** index in leg shape */
@property (nonatomic, readonly) uint32_t shapeIndex;

/** index in step bounds(i.e. on each new step we start indexing from 0) */
@property (nonatomic, readonly) uint32_t intersectionIndex;

/**
 * List of known names and shields for the current road.
 * Semantically corresponds to `BannerSection.components`.
 *
 * To retrieve legacy data:
 * - roadName - join `text` field of `roads` from beginning until `roads` end or `text == "/"`
 * - imageBaseUrl - use the first non-empty `imageBaseUrl` in `roads`
 * - shieldName - get the last path component of `imageBaseUrl`
 */
@property (nonatomic, readonly, nonnull, copy) NSArray<MBNNRoad *> *roads;

/** voice instruction to be presented */
@property (nonatomic, readonly, nullable) MBNNVoiceInstruction *voiceInstruction;

/** banner instruction to be presented */
@property (nonatomic, readonly, nullable) MBNNBannerInstruction *bannerInstruction;

/**
 * current speed limit
 *  `nullopt` for unknown speed limit
 */
@property (nonatomic, readonly, nullable) MBNNSpeedLimit *speedLimit;

/**
 * Contains key points(for example corners) of route shape passed by pack between `getStatus` calls or from last notification of observer.
 * For now can be used in route mode only, always contain at least one point besides the very first `getStatus` call.
 * Only `coordinate`, ``bearing`, `monotonicTimestampNanoseconds` and `time` fields are filled. Last point is always the same as `location`.
 */
@property (nonatomic, readonly, nonnull, copy) NSArray<MBNNFixLocation *> *keyPoints;

/** Output of map matcher on this status. */
@property (nonatomic, readonly, nonnull) MBNNMapMatcherOutput *mapMatcherOutput;

/**
 * Probability of vehicle to be off-road:
 * 1.0 - vehicle is definitely off-road, 0.0 - vehicle is definitely on-road
 */
@property (nonatomic, readonly) float offRoadProba;

/** Will be empty if we are in free-drive now(i.e. routeState == invalid) */
@property (nonatomic, readonly, nullable) MBNNActiveGuidanceInfo *activeGuidanceInfo;

/** Array of upcoming route alerts, doesn't contain route alerts that were already passed by user */
@property (nonatomic, readonly, nonnull, copy) NSArray<MBNNUpcomingRouteAlert *> *upcomingRouteAlerts;

/** Index of next waypoint on the route in the initial list of waypoints. If no waypoints - 0 */
@property (nonatomic, readonly) uint32_t nextWaypointIndex;

/** current Z-level, can be used to build route from proper level of road */
@property (nonatomic, readonly, nullable) NSNumber *layer;


@end
