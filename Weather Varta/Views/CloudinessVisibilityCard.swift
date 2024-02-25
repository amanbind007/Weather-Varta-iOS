//
//  CloudinessVisibilityCard.swift
//  Weather Varta
//
//  Created by Aman Bind on 23/02/24.
//

import SwiftUI

struct CloudinessVisibilityCard: View {
    
    var visibility: String
    var cloudiness: Int
    
    init(visibility: Double, cloudiness: Int) {
        
        self.cloudiness = cloudiness
        
        let visi = visibility/1000
        self.visibility = String(format: "%.3f", visi)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "eye")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(visibility)")
                            .font(.title2)
                        Text("km")
                            .font(.footnote)
                            .offset(x: -5, y: 2)
                    }
                    
                    Text("VISIBILITY")
                        .font(.caption2)
                }
            }.offset(x: 25)
            
            Divider()
            HStack {
                Image(systemName: "cloud")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(cloudiness)")
                            .font(.title2)
                        Text("%")
                            .font(.footnote)
                            .offset(x: -5, y: 2)
                    }
                    Text("CLOUDINESS")
                        .font(.caption2)
                }
            }
            .offset(x: 25)
        }
        .frame(width: 173, height: 140)
        .background(Color("background_card"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    CloudinessVisibilityCard(visibility: 6432, cloudiness: 50)
}
