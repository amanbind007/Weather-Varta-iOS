//
//  WindSpeedAndDirectionCard.swift
//  Weather Varta
//
//  Created by Aman Bind on 23/02/24.
//

import SwiftUI

struct WindSpeedAndDirectionCard: View {
    
    var windSpeed: String
    var windDirection: String
    
    init(windSpeed: Double, windDirection: String) {
        
        self.windDirection = windDirection
        
        self.windSpeed = String(format: "%.2f", windSpeed)
        
    }
    
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "wind")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    
                HStack {
                    Text("\(windSpeed)")
                        .font(.title2)
                    
                    Text("m/s")
                        .font(.footnote)
                        .offset(x: -5, y: 2)
                }
                Text("WIND\nSPEED")
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                    .offset(y: 5)
            }
            
            Divider()
            VStack(alignment: .center) {
                Image(systemName: "safari")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                
                Text(windDirection)
                    .font(.title2)
                Text("WIND\nDIRECTION")
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                    .offset(y: 5)
            }
        }
        .frame(width: 173, height: 140)
        .background(Color("background_card"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    WindSpeedAndDirectionCard(windSpeed: 5.6, windDirection: "NNE")
}
