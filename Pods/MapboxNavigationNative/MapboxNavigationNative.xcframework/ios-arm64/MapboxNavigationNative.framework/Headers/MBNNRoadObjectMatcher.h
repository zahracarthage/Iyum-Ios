// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBNNCacheHandle;
@class MBNNMatchableGeometry;
@class MBNNMatchableOpenLr;
@class MBNNMatchablePoint;
@protocol MBNNRoadObjectMatcherListener;

/**
 * The class allows to obtain matched to the road graph RoadObjects.
 *
 * Matching preforms asyncroniously, so before to start matching you should
 * setListener to get matching results. It is possible to match such kinds of
 * objects:
 *
 * - Point. Might be matched from encoded OpenLR or by one coordinate. Matched
 *   to only one edge of the road graph. It means that matched point will be
 *   tracked by electronic horizon by only one direction of riding. You may set
 *   direction during encoding OpenLR or make sure that projection of the point
 *   to the closet road would be placed from the needed side.
 *
 * - Gantry. Might be matched by two coordinates. It is the line which crosses
 *   a road, is tracked from both directions.
 *
 * - Polygon. Might be matched by three or more coordinates. Complex polygons
 *   (with inner and outer rings) are not supported for now. Polygon is tracked
 *   by intersections of its edges and road graph edges.
 *
 * - Polyline. Might be matched from encoded OpenLR or by two or more
 *   coordinates. Line is tracked in one direction, the direction might be set
 *   in OpenLR or by the order of coordinates.
 *
 * Every matching method contains the special flag `useOnlyPreloadedTiles`. If
 * this flag is set false, the objects wouldn't start matching before all
 * required tiles are loaded in cache. If the flag is set true, matching will
 * be performed only if all required for the particular object tiles are loaded
 * in cache and return an error in the listener otherwise.
 *
 * Only matching transactions with `useOnlyPreloadedTiles=false` could be
 * cancelled.
 *
 * Cancel calls onCancel callback for each `id`, even if there is no scheduled object with such `id`.
 */
NS_SWIFT_NAME(RoadObjectMatcher)
__attribute__((visibility ("default")))
@interface MBNNRoadObjectMatcher : NSObject

// This class provides custom init which should be called
- (nonnull instancetype)init NS_UNAVAILABLE;

// This class provides custom init which should be called
+ (nonnull instancetype)new NS_UNAVAILABLE;

- (nonnull instancetype)initWithCache:(nonnull MBNNCacheHandle *)cache;
/** Schedules a batch of OpenLRs to match. */
- (void)matchOpenLRsForOpenLrs:(nonnull NSArray<MBNNMatchableOpenLr *> *)openLrs
         useOnlyPreloadedTiles:(BOOL)useOnlyPreloadedTiles;
/** Schedules a batch of polylines to match. */
- (void)matchPolylinesForPolylines:(nonnull NSArray<MBNNMatchableGeometry *> *)polylines
             useOnlyPreloadedTiles:(BOOL)useOnlyPreloadedTiles;
/** Schedules a batch of polygons to match. */
- (void)matchPolygonsForPolygons:(nonnull NSArray<MBNNMatchableGeometry *> *)polygons
           useOnlyPreloadedTiles:(BOOL)useOnlyPreloadedTiles;
/** Schedules a batch of gantries to match. */
- (void)matchGantriesForGantries:(nonnull NSArray<MBNNMatchableGeometry *> *)gantries
           useOnlyPreloadedTiles:(BOOL)useOnlyPreloadedTiles;
/** Schedules a batch of points to match. */
- (void)matchPointsForPoints:(nonnull NSArray<MBNNMatchablePoint *> *)points
       useOnlyPreloadedTiles:(BOOL)useOnlyPreloadedTiles;
/** Cancels a batch of previously scheduled objects matching. */
- (void)cancelForIds:(nonnull NSArray<NSString *> *)ids;
/** Cancels all scheduled matchings. */
- (void)cancelAll;

@end
