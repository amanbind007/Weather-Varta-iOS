//
//  NetworkManager.swift
//  Weather Varta
//
//  Created by Aman Bind on 18/02/24.
//

import CoreLocation
import Foundation

@Observable
class NetworkManager {
    let base_url = "https://api.openweathermap.org/data/2.5/weather?"
    
    var result: WeatherModel?
    
    func fetchWeatherByName(city: String) {
        print("City: \(city)")
        let session = URLSession(configuration: .default)
        
        let url = URL(string: base_url + "q=\(city)&appid=67108a2cd62a3051587cb3ad432b9423&units=metric")
        
        session.dataTask(with: URLRequest(url: url!)) { data, _, error in
            
            if error == nil {
                if let safeData = data {
                    self.parseJSON(safeData)
                }
            }
        }.resume()
    }
    
    func fetchWeatherByLocation(coordinate: CLLocationCoordinate2D) {
        let session = URLSession(configuration: .default)
        
        let url = URL(string: base_url + "lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&appid=67108a2cd62a3051587cb3ad432b9423&units=imperial")
        
        session.dataTask(with: URLRequest(url: url!)) { data, _, error in
            
            if error == nil {
                if let safeData = data {
                    self.parseJSON(safeData)
                }
            }
        }.resume()
    }
    
    func parseJSON(_ weatherData: Data) {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherResult.self, from: weatherData)

            let weather_id = decodedData.weather[0].id
            let weather_desc = decodedData.weather[0].description
            let weather_icon = decodedData.weather[0].icon
            let temperature = decodedData.main.temp
            let min_temp = decodedData.main.temp_min
            let max_temp = decodedData.main.temp_max
            let temp_feels_like = decodedData.main.feels_like
            let pressure = decodedData.main.pressure
            let humidity = decodedData.main.humidity
            let wind_speed = decodedData.wind.speed
            let wind_degree = decodedData.wind.deg
            let cloudiness = decodedData.clouds.all
            let visibility = decodedData.visibility
            let city_name = decodedData.name
            let country = decodedData.sys.country
            
            let sunriseDate = Date(timeIntervalSince1970: decodedData.sys.sunrise)

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            let sunrise = dateFormatter.string(from: sunriseDate)
            
            let sunsetDate = Date(timeIntervalSince1970: decodedData.sys.sunset)
            let sunset = dateFormatter.string(from: sunsetDate)
            
            result = WeatherModel(weather_id: weather_id, weather_desc: weather_desc, weather_icon: weather_icon, temperature: temperature, min_temp: min_temp, max_temp: max_temp, temp_feels_like: temp_feels_like, pressure: pressure, humidity: humidity, wind_speed: wind_speed, wind_degree: wind_degree, cloudiness: cloudiness, visibility: visibility, city_name: city_name, country: country, sunrise: sunrise, sunset: sunset)
            
        } catch {
            print("Could Not Prase the JSON because: \(error.localizedDescription)")
            print("Error: \(error)")
        }
    }
}
