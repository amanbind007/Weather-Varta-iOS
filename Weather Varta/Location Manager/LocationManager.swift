//
//  LocationManager.swift
//  Weather Varta
//
//  Created by Aman Bind on 19/02/24.
//

import Foundation
import CoreLocation

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var location : CLLocationCoordinate2D?
    
    override init(){
        super.init()
        manager.delegate = self
    }
    
    func requestLocation(){
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
}
