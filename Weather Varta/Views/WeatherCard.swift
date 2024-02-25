//
//  WeatherCard.swift
//  Weather Varta
//
//  Created by Aman Bind on 23/02/24.
//

import SwiftUI

struct WeatherCard: View {
    
    var temp: String
    var temp_min: String
    var temp_max: String
    var icon: String
    var feels_like: String
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 20, content: {
                Image(systemName: icon)
                    .symbolRenderingMode(.monochrome)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .offset(y: 10)
                
                Text("\(temp)")
                    .font(.system(size: 80))
                    .offset(x: 15)
                    
                Text("℃")
                    .offset(y: 15)
                        
            })
            .offset(y: 20)
            
            Text("Clear")
                .offset(y: 10)
                
            HStack {
                Spacer()
                VStack {
                    HStack {
                        Text("MAX:")
                        Text("\(temp_max)℃")
                    }
                    
                    HStack {
                        Text("MIN:")
                        Text("\(temp_min)℃")
                    }
                }
                .offset(y: 5)
                
                Spacer()
                HStack {
                    Image(systemName: "thermometer.medium")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        .offset(y:6)
                    
                    VStack {
                        Text("\(feels_like)℃")
                            .font(.largeTitle)
                            .offset(y: 5)
                        Text("FEELS LIKE")
                            .font(.caption2)
                    }
                }
                Spacer()
            }
        }
        .frame(width: 356, height: 250)
        .background(Color("background_card_big"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    WeatherCard(temp: "25.6", temp_min: "15.0", temp_max: "30.5", icon: "cloud", feels_like: "27.0")
}
