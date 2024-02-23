//
//  SunriseSunsetCard.swift
//  Weather Varta
//
//  Created by Aman Bind on 23/02/24.
//

import SwiftUI

struct SunriseSunsetCard: View {
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "sunrise.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                
                HStack {
                    Text("5:30")
                        .font(.title3)
                        .offset(y: -5)
                    Text("PM")
                        .font(.caption2)
                        .offset(x: -5, y: -5)
                }
                    
                Text("SUNRISE")
                    .font(.caption2)
            }
            
            Divider()
            
            VStack {
                Image(systemName: "sunset.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                
                HStack {
                    Text("5:30")
                        .font(.title3)
                        .offset(y: -5)
                    Text("PM")
                        .font(.caption2)
                        .offset(x: -5, y: -5)
                }
                Text("SUNSET")
                    .font(.caption2)
            }
        }
        .frame(width: 173, height: 140)
        .background(Color("background_card"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    SunriseSunsetCard()
}
