//
//  Weather.swift
//  Weather Varta
//
//  Created by Aman Bind on 20/02/24.
//

import Foundation

struct WeatherModel {
    var weather_id: Int
    var weather_desc: String
    var temperature: Double
    var min_temp: Double
    var max_temp: Double
    var temp_feels_like: Double
    var pressure: Double
    var humidity: Double
    var wind_speed: Double
    var wind_direction: Int
    var cloudiness: Int
    var city_name: String
    var country: String
    
    var temperature_string: String {
        return String(format: "%.1f", temperature)
    }
    
    var min_temp_string: String {
        return String(format: "%.1f", min_temp)
    }
    
    var max_temp_string: String {
        return String(format: "%.1f", max_temp)
    }
    
    var temp_feels_like_string: String {
        return String(format: "%.1f", temp_feels_like)
    }
    
    var conditionName: String {
        switch weather_id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.sun"
            
        default:
            return "cloud"
        }
    }
}
