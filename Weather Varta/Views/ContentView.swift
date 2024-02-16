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
    
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    TextField("Enter your City", text: $searchCity)
                        .foregroundStyle(.pink)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(action: {}, label: {
                        Image(systemName: "location.circle.fill").imageScale(.large)
                            .foregroundStyle(.blue)
                    })
                }
                
                Spacer(minLength: 15)
                
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
                Spacer(minLength: 15)
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
                    
                    Spacer(minLength: 15)
                    
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
                Spacer(minLength: 15)
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
                    
                    Spacer(minLength: 15)
                    
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
        .navigationTitle("City Name")
        .padding()
        .background(Color("background"))
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
