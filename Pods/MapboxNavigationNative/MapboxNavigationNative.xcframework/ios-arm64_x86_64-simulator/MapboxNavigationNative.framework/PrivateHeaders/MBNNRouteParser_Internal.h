// This file is generated and will be overwritten automatically.

#import <MapboxNavigationNative/MBNNRouteParser.h>
#import <MapboxNavigationNative/MBNNRouteParserCallback_Internal.h>

@interface MBNNRouteParser ()
+ (nonnull MBXExpected *)parseDirectionsResponseForResponse:(nonnull NSString *)response
                                                    request:(nonnull NSString *)request __attribute((ns_returns_retained));
+ (void)parseDirectionsResponseForResponse:(nonnull NSString *)response
                                   request:(nonnull NSString *)request
                                  callback:(nonnull MBNNRouteParserCallback)callback;
@end
