//
//  ContentView.swift
//  Weather Varta
//
//  Created by Aman Bind on 10/02/24.
//

import CoreLocationUI
import SwiftUI
import AlertToast

struct WeatherView: View {
    @State private var searchCity: String = ""
    
    @Environment(\.colorScheme) private var theme
    
    @State private var networkManager = NetworkManager()
    @State private var locationManager = LocationDataManager()
    
    var body: some View {
        if let location = locationManager.location {
            if networkManager.result == nil {
                ProgressView()
                    .onAppear(perform: {
                    networkManager.fetchWeatherByLocation(coordinate: location)
                        
                })
            }
            else if let result = networkManager.result {
                VStack {
                    ScrollView {
                        SearchBarView(searchCity: $searchCity, networkManager: $networkManager, locationManager: $locationManager)
                        
                        Spacer(minLength: 12)
                        
                        WeatherCard(temp: result.temperature_string, temp_min: result.min_temp_string, temp_max: result.max_temp_string, icon: result.icon_String, feels_like: result.temp_feels_like_string, description: result.weather_desc)
                        
                        Spacer(minLength: 12)
                        
                        HStack {
                            
                            SunriseSunsetCard(sunset: result.sunset, sunrise: result.sunrise)
                            Spacer(minLength: 12)
                            CloudinessVisibilityCard(visibility: result.visibility, cloudiness: result.cloudiness)
                        }
                        
                        Spacer(minLength: 12)
                        
                        HStack {
                            HumidityPressureCard(pressure: result.pressure, humidity: result.humidity)
                            Spacer(minLength: 12)
                            WindSpeedAndDirectionCard(windSpeed: result.wind_speed, windDirection: result.wind_direction)
                        }
                    }
                    .refreshable {
                        networkManager.fetchWeatherByLocation(coordinate: location)
                    }
                }
                .navigationTitle(networkManager.result?.location_full_name ?? "--")
                .padding()
                .background(Color("background"))
                .onChange(of: locationManager.location) {
                    networkManager.fetchWeatherByLocation(coordinate: location)
                }
                .toast(isPresenting: $networkManager.errorLoading) {
                    AlertToast(displayMode: .alert, type: .error(.red), title: "Location Not Found")
                }
            }
        }
        
        else {
            
            Text("Provide \"Current Location\" by clicking the below button to Proceed forward")
                .frame(width: 250, height: 150)
                .font(.title3)
                .multilineTextAlignment(.center)
                
            
            LocationButton {
                locationManager.requestLocation()
            }
            .tint(Color.backgroundCardBig)
            .foregroundStyle(theme == .dark ? Color.white : Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
        }
    }
}

#Preview {
    NavigationStack {
        WeatherView()
    }
}
