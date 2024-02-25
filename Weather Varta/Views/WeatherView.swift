//
//  ContentView.swift
//  Weather Varta
//
//  Created by Aman Bind on 10/02/24.
//

import CoreLocationUI
import SwiftUI

struct WeatherView: View {
    @State private var searchCity: String = ""
    
    @Environment(\.colorScheme) private var theme
    
    @State private var networkManager = NetworkManager()
    @State private var locationManager = LocationDataManager()
    
    var body: some View {
        if let location = locationManager.location {
            if networkManager.result == nil {
                ProgressView().onAppear(perform: {
                    networkManager.fetchWeatherByLocation(coordinate: location)
                })
            }
            else if let result = networkManager.result {
                VStack {
                    ScrollView {
                        SearchBarView(searchCity: $searchCity, networkManager: $networkManager, locationManager: $locationManager)
                        
                        Spacer(minLength: 12)
                        
                        WeatherCard(temp: result.temperature_string, temp_min: result.min_temp_string, temp_max: result.max_temp_string, icon: result.icon_String, feels_like: result.temp_feels_like_string)
                        
                        Spacer(minLength: 12)
                        
                        HStack {
                            
                            SunriseSunsetCard(sunset: result.sunset, sunrise: result.sunrise)
                            Spacer(minLength: 12)
                            CloudinessVisibilityCard()
                        }
                        
                        Spacer(minLength: 12)
                        
                        HStack {
                            HumidityPressureCard(pressure: result.pressure, humidity: result.humidity)
                            Spacer(minLength: 12)
                            WindSpeedAndDirectionCard(windSpeed: networkManager.result!.wind_speed, windDirection: networkManager.result!.wind_direction)
                        }
                    }
                }
                .navigationTitle(networkManager.result?.location_full_name ?? "--")
                .padding()
                .background(Color("background"))
            }
        }
        
        else {
            LocationButton {
                locationManager.requestLocation()
            }
        }
    }
}

#Preview {
    NavigationStack {
        WeatherView()
    }
}
