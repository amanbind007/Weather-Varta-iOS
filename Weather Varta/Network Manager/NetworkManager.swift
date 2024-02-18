//
//  NetworkManager.swift
//  Weather Varta
//
//  Created by Aman Bind on 18/02/24.
//

import Foundation

@Observable
class NetworkManager {
    let url = "https://api.openweathermap.org/data/2.5/weather?q=indore&appid=67108a2cd62a3051587cb3ad432b9423&units=imperial"
    
    var result: Result?
    
    func fetchWeatherByLocation(city: String) {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URLRequest(url: URL(string: url)!)) { data, _, error in
            
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let result = try decoder.decode(Result.self, from: safeData)
                        
                        DispatchQueue.main.async {
                            self.result = result
                        }
                        
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}
