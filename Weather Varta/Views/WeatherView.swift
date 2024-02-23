//
//  ContentView.swift
//  Weather Varta
//
//  Created by Aman Bind on 10/02/24.
//

import SwiftUI

struct WeatherView: View {
    @State private var searchCity: String = ""
    
    @Environment(\.colorScheme) private var theme
    
    @State private var networkManager = NetworkManager()
    @State private var locationManager = LocationDataManager()
    
    var body: some View {
        VStack {
            ScrollView {
                SearchBarView(searchCity: $searchCity, networkManager: $networkManager, locationManager: $locationManager)
                
                Spacer(minLength: 12)
                WeatherCard()
                Spacer(minLength: 12)
                
                HStack {
                    SunriseSunsetCard()
                    Spacer(minLength: 12)
                    CloudinessVisibilityCard()
                }
                
                Spacer(minLength: 12)
                
                HStack {
                    HumidityPressureCard()
                    Spacer(minLength: 12)
                    WindSpeedAndDirectionCard()
                }
            }
        }
        .navigationTitle(networkManager.result?.location_full_name ?? "--")
        .padding()
        .background(Color("background"))
        .onAppear {
            locationManager.requestLocation()
        }
    }
}

#Preview {
    NavigationStack {
        WeatherView()
    }
}
