//
//  MapViewController.swift
//  miniprojet
//
//  Created by Zahra chouchane on 28/4/2022.
//

import UIKit
import MapboxMaps
import MapboxCoreNavigation
import MapboxNavigation
import MapboxDirections
import CoreLocation


class MapViewController: UIViewController {
 
    
    internal var mapView: MapView!
    internal var cameraLocationConsumer: CameraLocationConsumer!
    internal let toggleBearingImageButton: UIButton = UIButton(frame: .zero)
    internal var showsBearingImage: Bool = false {
        didSet {
        syncPuckAndButton()
        }
    }
    
        override public func viewDidLoad() {
        super.viewDidLoad()
            
            let centerCoordinate = CLLocationCoordinate2D(latitude: 36.902445, longitude: 10.189186)
           
            let options = MapInitOptions(cameraOptions: CameraOptions(zoom: 15.0))
     
            mapView = MapView(frame: view.bounds, mapInitOptions: options)
            mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         
            
            setupToggleShowBearingImageButton()
            view.addSubview(mapView)
         
        cameraLocationConsumer = CameraLocationConsumer(mapView: mapView)
             mapView.location.options.puckType = .puck2D()
             mapView.mapboxMap.onNext(.mapLoaded) { _ in
        self.mapView.location.addLocationConsumer(newConsumer: self.cameraLocationConsumer)
            }
            
            let pointAnnotationManager = mapView.annotations.makePointAnnotationManager()
            var customPointAnnotation = PointAnnotation(coordinate: centerCoordinate)
            customPointAnnotation.image = .init(image: UIImage(named: "red_pin")!, name: "red_pin")
            pointAnnotationManager.annotations = [customPointAnnotation]
    }
    
         
        @objc func showHideBearingImage() {
        showsBearingImage.toggle()
        }
         
        func syncPuckAndButton() {
        // Update puck config
        let configuration = Puck2DConfiguration.makeDefault(showBearing: showsBearingImage)
         
        mapView.location.options.puckType = .puck2D(configuration)
         
        let title: String = showsBearingImage ? "Hide bearing image" : "Show bearing image"
        toggleBearingImageButton.setTitle(title, for: .normal)
        }
         
        private func setupToggleShowBearingImageButton() {
        toggleBearingImageButton.backgroundColor = .systemBlue
        toggleBearingImageButton.addTarget(self, action: #selector(showHideBearingImage), for: .touchUpInside)
        toggleBearingImageButton.setTitleColor(.white, for: .normal)
        syncPuckAndButton()
        toggleBearingImageButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toggleBearingImageButton)
         
        // Constraints
        toggleBearingImageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0).isActive = true
        toggleBearingImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0).isActive = true
        toggleBearingImageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100.0).isActive = true
        }
        }
        
        public class CameraLocationConsumer: LocationConsumer {
        weak var mapView: MapView?
         
        init(mapView: MapView) {
        self.mapView = mapView
        }
         
        public func locationUpdate(newLocation: Location) {
        mapView?.camera.ease(
        to: CameraOptions(center: newLocation.coordinate, zoom: 15),
        duration: 1.3)
        }
        }
