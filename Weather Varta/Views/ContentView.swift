//
//  ContentView.swift
//  Weather Varta
//
//  Created by Aman Bind on 10/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var search : String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                
                Image(systemName: "cloud.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                
                Text("Haze/Cloudy/Whatever")
                    
                HStack(alignment: .top, content: {
                    Text("35")
                        
                        .font(.system(size: 100))
                        
                    Text("℃")
                        .offset(y:18)
                })
                
                HStack{
                    Text("High:")
                    Text("23℃")
                    
                    Text("Low:")
                    Text("8℃")
                }
                
            }
        }
        .navigationTitle("City Name")
        .searchable(text: $search, prompt: "Enter you city")
        .padding()
        
    }
}

#Preview {
    NavigationStack{
        ContentView()
    }
}
