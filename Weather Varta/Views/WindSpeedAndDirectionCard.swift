//
//  WindSpeedAndDirectionCard.swift
//  Weather Varta
//
//  Created by Aman Bind on 23/02/24.
//

import SwiftUI

struct WindSpeedAndDirectionCard: View {
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "wind")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    
                HStack {
                    Text("3.6")
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
                
                Text("NNE")
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
    WindSpeedAndDirectionCard()
}
