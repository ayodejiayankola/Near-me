//
//  LandmarkListView.swift
//  NearMe
//
//  Created by Ayodeji Ayakola  on 19/05/2021.
//

import SwiftUI

struct LandmarkListView: View {
    
    let landmarks: [LandmarkViewModel]
    
    var body: some View {
        List(landmarks, id: \.id) { landmark in
            VStack(alignment: .leading, spacing: 10) {
                Text(landmark.name)
                    .font(.headline)
                Text(landmark.title)
            }
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView(landmarks: [])
    }
}
