//
//  LandmarkViewModel.swift
//  NearMe
//
//  Created by Ayodeji Ayakola  on 19/05/2021.
//

import Foundation
import MapKit

struct LandmarkViewModel: Identifiable {
    
    let placemark: MKPlacemark
    
    let id = UUID()
    
    var name: String {
        placemark.name ?? ""
    }
    
    var title: String {
        placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        placemark.coordinate
    }
    
}
