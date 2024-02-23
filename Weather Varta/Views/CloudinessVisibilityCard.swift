//
//  CloudinessVisibilityCard.swift
//  Weather Varta
//
//  Created by Aman Bind on 23/02/24.
//

import SwiftUI

struct CloudinessVisibilityCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "eye")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    
                VStack(alignment: .leading) {
                    HStack {
                        Text("6.0")
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
                        Text("50")
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
    CloudinessVisibilityCard()
}
