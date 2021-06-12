//
//  RecenterButton.swift
//  NearMe
//
//  Created by Ayodeji Ayakola  on 19/05/2021.
//

import SwiftUI

struct RecenterButton: View {
    let onTapped: () -> ()
    
    var body: some View {
        Button(action: onTapped, label: {
            Label("Re-center", systemImage: "triangle")
        })
        .padding(10)
        .foregroundColor(.white)
        .background(Color.green)
        .clipShape(RoundedRectangle(cornerRadius: 16.0, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
    }
}

struct RecenterButton_Previews: PreviewProvider {
    static var previews: some View {
        RecenterButton(onTapped:{})
    }
}
