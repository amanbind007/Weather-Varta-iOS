//
//  WeatherCard.swift
//  Weather Varta
//
//  Created by Aman Bind on 23/02/24.
//

import SwiftUI

struct WeatherCard: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 20, content: {
                Image(systemName: "sun.max.trianglebadge.exclamationmark")
                    .symbolRenderingMode(.monochrome)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .offset(y: 10)
                
                Text("25")
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
                        Text("25℃")
                    }
                    
                    HStack {
                        Text("MIN:")
                        Text("25℃")
                    }
                }
                .offset(y: 5)
                
                Spacer()
                HStack {
                    Image(systemName: "thermometer.medium")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    
                    VStack {
                        Text("25℃")
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
    WeatherCard()
}
