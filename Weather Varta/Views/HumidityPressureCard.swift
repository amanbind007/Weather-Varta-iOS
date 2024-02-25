//
//  HumidityPressureCard.swift
//  Weather Varta
//
//  Created by Aman Bind on 23/02/24.
//

import SwiftUI

struct HumidityPressureCard: View {
    var pressure: String
    var humidity: Int
    
    init(pressure: Int, humidity: Int) {
        self.humidity = humidity
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value: pressure))
        
        self.pressure = formattedNumber!
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "humidity")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(humidity)")
                            .font(.title2)
                        Text("%")
                            .font(.footnote)
                            .offset(x: -5, y: 2)
                    }
                    
                    Text("HUMIDITY")
                        .font(.caption2)
                }
            }.offset(x: 25)
            
            Divider()
            HStack {
                Image(systemName: "gauge")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                VStack(alignment: .leading) {
                    HStack {
                        Text(pressure)
                            .font(.title2)
                        Text("hPa")
                            .font(.footnote)
                            .offset(x: -5, y: 2)
                    }
                    Text("PRESSURE")
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
    HumidityPressureCard(pressure: 1024, humidity: 60)
}
