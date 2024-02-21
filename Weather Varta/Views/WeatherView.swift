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
    @State private var locationManger = LocationDataManager()
    
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 320, height: 40)
                        .foregroundColor(Color.backgroundCard)
                        .overlay {
                            HStack {
                                Image(systemName: "map.fill")
                                    .padding()
                                TextField("Enter your City", text: $searchCity)
                                    .textFieldStyle(.plain)
                                    .font(.title3)
                                    .autocorrectionDisabled()
                                    .textInputAutocapitalization(.never)
                                    .submitLabel(.search)
                                    .onSubmit {
                                        networkManager.fetchWeatherByName(city: searchCity)
                                    }
                            }
                        }
                        .padding(1)
                        
                    Button(action: {
                        locationManger.requestLocation()
                        networkManager.fetchWeatherByLocation(coordinate: locationManger.location!)
                    }, label: {
                        Image(systemName: "location.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.blue)
                            
                    })
                }
                
                Spacer(minLength: 12)
                
                VStack {
                    HStack(alignment: .top, spacing: 20, content: {
                        Image(systemName: networkManager.result?.icon_String ?? "sun.max.trianglebadge.exclamationmark")
                            .symbolRenderingMode(.monochrome)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .offset(y: 10)
                        
                        Text(networkManager.result?.temperature_string ?? "25")
                            .font(.system(size: 80))
                            .offset(x: 15)
                            
                        Text("℃")
                            .offset(y: 15)
                                
                    })
                    .offset(y:20)
                    
                    Text(networkManager.result?.weather_desc ?? "Clear")
                        .offset(y: 10)
                        
                    
                    HStack{
                        Spacer()
                        VStack {
                            HStack{
                                Text("MAX:")
                                Text(networkManager.result?.max_temp_string ?? "25℃")
                            }
                            
                            HStack{
                                Text("MIN:")
                                Text(networkManager.result?.min_temp_string ?? "25℃")
                            }
                        }
                        .offset(y:5)
                        
                        Spacer()
                        HStack {
                            Image(systemName: "thermometer.medium")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                            
                            VStack {
                                Text(networkManager.result?.temp_feels_like_string ?? "25℃")
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
                Spacer(minLength: 12)
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "eye")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                
                            VStack(alignment: .leading) {
                                HStack{
                                    Text("10")
                                        .font(.title2)
                                    Text("km")
                                        .font(.footnote)
                                        .offset(x:-5, y:2)
                                }
                                
                                Text("VISIBILITY")
                                    .font(.caption2)
                            }
                        }.offset(x:20)
                        
                        Divider()
                        HStack {
                            Image(systemName: "cloud")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                            VStack(alignment: .leading) {
                                HStack{
                                    Text("60")
                                        .font(.title2)
                                    Text("%")
                                        .font(.footnote)
                                        .offset(x:-5, y:2)
                                }
                                Text("CLOUDINESS")
                                    .font(.caption2)
                            }
                        }
                        .offset(x:20)
                    }
                    .frame(width: 173, height: 140)
                    .background(Color("background_card"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer(minLength: 12)
                    
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "gauge.with.dots.needle.bottom.50percent")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                           
                                Text("1019")
                                    .font(.title2)
                                    
                            
                            
                                
                            Text("PRESSURE")
                                .font(.caption2)
                        }
                        Spacer()
                        Divider()
                        Spacer()
                        VStack {
                            Image(systemName: "humidity.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                            HStack{
                                Text("50")
                                    .font(.title2)
                                    
                                Text("%")
                                    .font(.footnote)
                                    .offset(x:-5, y:2)
                            }
                            .offset(y:-5)
                            
                            Text("HUMIDITY")
                                .font(.caption2)
                        }
                        Spacer()
                    }
                    .frame(width: 173, height: 140)
                    .background(Color("background_card"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                Spacer(minLength: 12)
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "wind")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                
                            VStack(alignment: .leading) {
                                Text("39 KPH")
                                    .font(.title2)
                                Text("WIND SPEED")
                                    .font(.caption2)
                            }
                        }.offset(x:20)
                        
                        Divider()
                        HStack {
                            Image(systemName: "safari")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                            VStack(alignment: .leading) {
                                Text("NNE")
                                    .font(.title2)
                                Text("WIND DIRECTION")
                                    .font(.caption2)
                            }
                        }
                        .offset(x:20)
                    }
                    .frame(width: 173, height: 140)
                    .background(Color("background_card"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer(minLength: 12)
                    
                    HStack {
                        
                        VStack {
                            Image(systemName: "sunrise.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                            
                            HStack{
                                Text("5:30")
                                    .font(.title3)
                                    .offset(y: -5)
                                Text("PM")
                                    .font(.caption2)
                                    .offset(x:-5, y:-5)
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
                            
                            HStack{
                                Text("5:30")
                                    .font(.title3)
                                    .offset(y: -5)
                                Text("PM")
                                    .font(.caption2)
                                    .offset(x:-5, y:-5)
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
        }
        .navigationTitle(networkManager.result?.location_full_name ?? "--")
        .padding()
        .background(Color("background"))
        .onAppear {
            locationManger.requestLocation()
        }
    }
}

#Preview {
    NavigationStack {
        WeatherView()
    }
}
