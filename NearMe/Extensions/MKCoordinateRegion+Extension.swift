//
//  MKCoordinateRegion+Extension.swift
//  NearMe
//
//  Created by Ayodeji Ayakola  on 19/05/2021.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    
    static var defaultRegion: MKCoordinateRegion {
        return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.5244, longitude: 3.3792), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
    
}
