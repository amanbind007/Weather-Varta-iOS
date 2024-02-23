//
//  SearchBarView.swift
//  Weather Varta
//
//  Created by Aman Bind on 23/02/24.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchCity: String
    @Binding var networkManager: NetworkManager
    @Binding var locationManager: LocationDataManager
    
    var body: some View {
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
                locationManager.requestLocation()
                networkManager.fetchWeatherByLocation(coordinate: locationManager.location!)
            }, label: {
                Image(systemName: "location.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.blue)
                    
            })
        }
    }
}

#Preview {
    SearchBarView(searchCity: .constant(""), networkManager: .constant(NetworkManager()), locationManager: .constant(LocationDataManager()))
}
