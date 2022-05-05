// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBNNBorderCrossingInfo;
@class MBNNIncidentInfo;
@class MBNNRailwayCrossingInfo;
@class MBNNServiceAreaInfo;
@class MBNNTollCollectionInfo;
@class MBNNTunnelInfo;
// NOLINTNEXTLINE(modernize-use-using)
typedef NS_ENUM(NSInteger, MBNNRoadObjectMetadataType)
{
    MBNNRoadObjectMetadataTypeIncidentInfo,
    MBNNRoadObjectMetadataTypeTunnelInfo,
    MBNNRoadObjectMetadataTypeBorderCrossingInfo,
    MBNNRoadObjectMetadataTypeTollCollectionInfo,
    MBNNRoadObjectMetadataTypeServiceAreaInfo,
    MBNNRoadObjectMetadataTypeRailwayCrossingInfo
} NS_SWIFT_NAME(RoadObjectMetadataType);

NS_SWIFT_NAME(RoadObjectMetadata)
__attribute__((visibility ("default")))
@interface MBNNRoadObjectMetadata : NSObject

- (nonnull instancetype)initWithValue:(nonnull id)value;

+ (nonnull instancetype)fromIncidentInfo:(nonnull MBNNIncidentInfo *)value;
+ (nonnull instancetype)fromTunnelInfo:(nonnull MBNNTunnelInfo *)value;
+ (nonnull instancetype)fromBorderCrossingInfo:(nonnull MBNNBorderCrossingInfo *)value;
+ (nonnull instancetype)fromTollCollectionInfo:(nonnull MBNNTollCollectionInfo *)value;
+ (nonnull instancetype)fromServiceAreaInfo:(nonnull MBNNServiceAreaInfo *)value;
+ (nonnull instancetype)fromRailwayCrossingInfo:(nonnull MBNNRailwayCrossingInfo *)value;

- (BOOL)isIncidentInfo;
- (BOOL)isTunnelInfo;
- (BOOL)isBorderCrossingInfo;
- (BOOL)isTollCollectionInfo;
- (BOOL)isServiceAreaInfo;
- (BOOL)isRailwayCrossingInfo;

- (nonnull MBNNIncidentInfo *)getIncidentInfo;
- (nonnull MBNNTunnelInfo *)getTunnelInfo;
- (nonnull MBNNBorderCrossingInfo *)getBorderCrossingInfo;
- (nonnull MBNNTollCollectionInfo *)getTollCollectionInfo;
- (nonnull MBNNServiceAreaInfo *)getServiceAreaInfo;
- (nonnull MBNNRailwayCrossingInfo *)getRailwayCrossingInfo;

@property (nonatomic, nonnull) id value;

@property (nonatomic, readonly) MBNNRoadObjectMetadataType type;

@end
