//
//  DriverAnnotation.swift
//  htchhkr
//
//  Created by nick.shi on 3/7/18.
//  Copyright © 2018 nick.shi. All rights reserved.
//

import Foundation
import MapKit

class DriverAnnotation : NSObject, MKAnnotation {
    dynamic var coordinate: CLLocationCoordinate2D
    var key: String
    
    init(coordinate: CLLocationCoordinate2D, withKey key: String) {
        self.coordinate = coordinate
        self.key = key
        super.init()
    }
    
    func update(annotationPosition annotation: DriverAnnotation, withCoordinate coordinate: CLLocationCoordinate2D) {
        var location = self.coordinate
        location.longitude = coordinate.longitude
        location.latitude = coordinate.latitude
        UIView.animate(withDuration: 0.2) {
            self.coordinate = location
        }
        
    }
}
