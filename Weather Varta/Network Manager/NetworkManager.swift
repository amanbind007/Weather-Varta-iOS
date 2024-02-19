//
//  NetworkManager.swift
//  Weather Varta
//
//  Created by Aman Bind on 18/02/24.
//

import Foundation

@Observable
class NetworkManager {
    let base_url = "https://api.openweathermap.org/data/2.5/weather?q="
    
    var result: Result?
    
    func fetchWeatherByName(city: String) {
        print("City: \(city)")
        let session = URLSession(configuration: .default)
        
        let url = URL(string: base_url + "\(city)&appid=67108a2cd62a3051587cb3ad432b9423&units=imperial")
        
        session.dataTask(with: URLRequest(url: url!)) { data, _, error in
            
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        print(safeData)
                        let result = try decoder.decode(Result.self, from: safeData)
                        
                        DispatchQueue.main.async {
                            self.result = result
                        }
                        
                    } catch {
                        print("Not Found")
                    }
                }
            }
        }.resume()
    }
    
}
