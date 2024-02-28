//
//  SunriseSunsetCard.swift
//  Weather Varta
//
//  Created by Aman Bind on 23/02/24.
//

import SwiftUI

struct SunriseSunsetCard: View {
    var sunset_time: String
    var sunset_meridian: String
    var sunrise_time: String
    var sunrise_meridian: String
    
    init(sunset: String, sunrise: String) {
        let time_parts1 = sunset.split(separator: " ")
        sunset_time = String(time_parts1[0])
        sunset_meridian = String(time_parts1[1])
        let time_parts2 = sunrise.split(separator: " ")
        sunrise_time = String(time_parts2[0])
        sunrise_meridian = String(time_parts2[1])
    }
    
    var body: some View {
        HStack {
            Spacer()
            VStack{
                Image(systemName: "sunrise.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                
                Text(sunrise_time)
                    .font(.title3)
                    
                Text(sunrise_meridian)
                    .font(.caption2)
                    .offset(y: -8)
                
                Text("SUNRISE")
                    .font(.caption2)
            }
            
            
            Spacer()
            
            Divider()
            
            Spacer()
            
            VStack {
                Image(systemName: "sunset.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                
                Text(sunset_time)
                    .font(.title3)
                    
                Text(sunset_meridian)
                    .font(.caption2)
                    .offset(y: -8)
                
                Text("SUNSET")
                    .font(.caption2)
            }
            
            Spacer()
        }
        .frame(width: 173, height: 140)
        .background(Color("background_card"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    SunriseSunsetCard(sunset: "06:30 PM", sunrise: "06:30 AM")
}
