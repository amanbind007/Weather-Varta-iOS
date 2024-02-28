//
//  LocationManager.swift
//  Weather Varta
//
//  Created by Aman Bind on 19/02/24.
//

import CoreLocation
import Foundation
import SwiftUI

@Observable
class LocationDataManager: NSObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    
    var location: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocation() {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Errorn Description: \(error.localizedDescription)")
        print("Error Traceback: \n\(error)")
    }
}
