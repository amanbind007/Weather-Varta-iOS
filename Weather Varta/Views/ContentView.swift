//
//  ContentView.swift
//  Weather Varta
//
//  Created by Aman Bind on 10/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchCity: String = ""
    
    @Environment(\.colorScheme) private var theme
    
    var networkManager = NetworkManager()
    
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
                        
                    Button(action: {}, label: {
                        Image(systemName: "location.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.blue)
                            
                    })
                }
                
                Spacer(minLength: 12)
                
                VStack {
                    Image(systemName: "cloud.rain")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                    
                    Text("Haze/Cloudy/Whatever")
                    
                    HStack(alignment: .top, content: {
                        Text("35")
                        
                            .font(.system(size: 80))
                        
                        Text("℃")
                            .offset(y: 18)
                    })
                    
                    HStack {
                        Text("High:")
                        Text("23℃")
                        
                        Text("Low:")
                        Text("8℃")
                    }
                }
                .frame(width: 356, height: 270)
                .background(Color("background_card_big"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer(minLength: 12)
                HStack {
                    VStack {
                        HStack {
                            Image(systemName: "humidity")
                            
                            VStack {
                                Text("fsdfsdfsf")
                                Text("232342424")
                            }
                        }
                    }
                    .frame(width: 173, height: 140)
                    .background(Color("background_card"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer(minLength: 12)
                    
                    VStack {
                        HStack {
                            Image(systemName: "wind")
                            
                            VStack {
                                Text("fsdfsdfsf")
                                Text("232342424")
                            }
                        }
                    }
                    .frame(width: 173, height: 140)
                    .background(Color("background_card"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                Spacer(minLength: 12)
                HStack {
                    VStack {
                        HStack {
                            Image(systemName: "humidity")
                            
                            VStack {
                                Text("fsdfsdfsf")
                                Text("232342424")
                            }
                        }
                    }
                    .frame(width: 173, height: 140)
                    .background(Color("background_card"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer(minLength: 12)
                    
                    VStack {
                        HStack {
                            Image(systemName: "humidity")
                            
                            VStack {
                                Text("fsdfsdfsf")
                                Text("232342424")
                            }
                        }
                    }
                    .frame(width: 173, height: 140)
                    .background(Color("background_card"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
        }
        .navigationTitle("\(networkManager.result?.name ?? "India"), \(networkManager.result?.sys.country ?? "Inodre")")
        .padding()
        .background(Color("background"))
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
