//
//  ContentView.swift
//  NearMe
//
//  Created by Ayodeji Ayakola  on 19/05/2021.
//

import SwiftUI
import MapKit

enum DisplayType {
    case map
    case list
}

struct ContentView: View {
    @StateObject private var placeViewModel = PlaceViewModel()
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var searchTerm: String = ""
    @State private var displayType: DisplayType = .map
    @State private var isDragged: Bool = false
    
    var body: some View {
        VStack {
            TextField("Search", text: $searchTerm, onEditingChanged: { _ in
                
            }, onCommit: {
                    // get all landmarks
                placeViewModel.searchLandmarks(searchTerm: searchTerm)
                
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            
            LandmarkCategoryView { (category) in
                placeViewModel.searchLandmarks(searchTerm: category)
            }
            
            Picker("Select", selection: $displayType) {
                Text("Map").tag(DisplayType.map)
                Text("List").tag(DisplayType.list)
            }.pickerStyle(SegmentedPickerStyle())
            
            if displayType == .map {
                Map(coordinateRegion: getRegion(), interactionModes: .all, showsUserLocation: true, userTrackingMode: $userTrackingMode, annotationItems: placeViewModel.landmarks) { landmark in
                    MapMarker(coordinate: landmark.coordinate)
                }
                .gesture(DragGesture()
                            .onChanged({ value in
                                isDragged = true
                            }))
                .overlay(isDragged ?
                            AnyView(RecenterButton {
                                placeViewModel.startUpdatingLocation()
                                
                            }) :
                            AnyView(EmptyView()),
                            alignment: .bottom)
            } else if displayType == .list {
                LandmarkListView(landmarks: placeViewModel.landmarks)
            }
        }.padding()
    }
    
    private func getRegion() -> Binding<MKCoordinateRegion> {
        guard let coordinate = placeViewModel.currentLocation else {
            return .constant(MKCoordinateRegion.defaultRegion)
        }
        return .constant(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
