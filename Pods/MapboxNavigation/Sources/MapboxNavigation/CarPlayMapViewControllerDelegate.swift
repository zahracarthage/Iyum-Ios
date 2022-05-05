import MapboxMaps
import MapboxCoreNavigation

/**
 The `CarPlayMapViewControllerDelegate` protocol provides methods for reacting to events during free-drive navigation or route previewing in `CarPlayMapViewController`.
 */
@available(iOS 12.0, *)
public protocol CarPlayMapViewControllerDelegate: AnyObject, UnimplementedLogging {
    
    /**
     Tells the receiver that the final destination `PointAnnotation` was added to the `CarPlayMapViewController`.
     
     - parameter carPlayMapViewController: The `CarPlayMapViewController` object.
     - parameter finalDestinationAnnotation: The point annotation that was added to the map view.
     - parameter pointAnnotationManager: The object that manages the point annotation in the map view.
     */
    func carPlayMapViewController(_ carPlayMapViewController: CarPlayMapViewController,
                                  didAdd finalDestinationAnnotation: PointAnnotation,
                                  pointAnnotationManager: PointAnnotationManager)
    
    /**
     Asks the receiver to return a `LineLayer` for the route line, given a layer identifier and a source identifier.
     This method is invoked when the map view loads and any time routes are added.
     
     - parameter carPlayMapViewController: The `CarPlayMapViewController` object.
     - parameter identifier: The `LineLayer` identifier.
     - parameter sourceIdentifier: Identifier of the source, which contains the route data that this method would style.
     - returns: A `LineLayer` that is applied to the route line.
     */
    func carPlayMapViewController(_ carPlayMapViewController: CarPlayMapViewController,
                                  routeLineLayerWithIdentifier identifier: String,
                                  sourceIdentifier: String) -> LineLayer?
    
    /**
     Asks the receiver to return a `LineLayer` for the casing layer that surrounds route line,
     given a layer identifier and a source identifier.
     This method is invoked when the map view loads and any time routes are added.
     
     - parameter carPlayMapViewController: The `CarPlayMapViewController` object.
     - parameter identifier: The `LineLayer` identifier.
     - parameter sourceIdentifier: Identifier of the source, which contains the route data that this method would style.
     - returns: A `LineLayer` that is applied as a casing around the route line.
     */
    func carPlayMapViewController(_ carPlayMapViewController: CarPlayMapViewController,
                                  routeCasingLineLayerWithIdentifier identifier: String,
                                  sourceIdentifier: String) -> LineLayer?
}

@available(iOS 12.0, *)
public extension CarPlayMapViewControllerDelegate {
    
    /**
     `UnimplementedLogging` prints a warning to standard output the first time this method is called.
     */
    func carPlayMapViewController(_ carPlayMapViewController: CarPlayMapViewController,
                                  didAdd finalDestinationAnnotation: PointAnnotation,
                                  pointAnnotationManager: PointAnnotationManager) {
        logUnimplemented(protocolType: CarPlayMapViewControllerDelegate.self, level: .debug)
    }
    
    /**
     `UnimplementedLogging` prints a warning to standard output the first time this method is called.
     */
    func carPlayMapViewController(_ carPlayMapViewController: CarPlayNavigationViewController,
                                         routeLineLayerWithIdentifier identifier: String,
                                         sourceIdentifier: String) -> LineLayer? {
        logUnimplemented(protocolType: CarPlayMapViewControllerDelegate.self, level: .debug)
        return nil
    }
    
    /**
     `UnimplementedLogging` prints a warning to standard output the first time this method is called.
     */
    func carPlayMapViewController(_ carPlayMapViewController: CarPlayNavigationViewController,
                                         routeCasingLineLayerWithIdentifier identifier: String,
                                         sourceIdentifier: String) -> LineLayer? {
        logUnimplemented(protocolType: CarPlayMapViewControllerDelegate.self, level: .debug)
        return nil
    }
}
