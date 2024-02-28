//
//  Location+Extension.swift
//  Weather Varta
//
//  Created by Aman Bind on 28/02/24.
//

import CoreLocation

extension CLLocationCoordinate2D: Equatable {
    static public func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
