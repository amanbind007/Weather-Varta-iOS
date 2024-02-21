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
    var weather_icon: String
    var temperature: Double
    var min_temp: Double
    var max_temp: Double
    var temp_feels_like: Double
    var pressure: Double
    var humidity: Double
    var wind_speed: Double
    var wind_degree: Double
    var cloudiness: Int
    var city_name: String
    var country: String
    
    var icon_String: String {
        switch weather_icon {
        case "01d":
            return "sun.max"
        case "02d":
            return "cloud.sun"
        case "03d":
            return "cloud"
        case "04d":
            return "cloud"
        case "09d":
            return "cloud.rain"
        case "10d":
            return "cloud.sun.rain"
        case "11d":
            return "cloud.bolt.rain"
        case "13d":
            return "snowflake"
        case "50d":
            return "sun.haze"
        case "01n":
            return "moon"
        case "02n":
            return "cloud.moon"
        case "03n":
            return "cloud"
        case "04n":
            return "cloud"
        case "09n":
            return "cloud.rain"
        case "10n":
            return "cloud.moon.rain"
        case "11n":
            return "cloud.bolt.rain"
        case "13n":
            return "snowflake"
        case "50n":
            return "moon.haze"
        default:
            return "sun.max.trianglebadge.exclamationmark"
        }
    }
    
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
    
    var location_full_name: String {
        return "\(city_name), \(country)"
    }

    var wind_direction: String {
        switch wind_degree {
        case 0...11.25:
            return "North"
        case 348.75...360:
            return "North"
        case 11.25...33.75:
            return "North North East"
        case 33.75...56.25:
            return "North East"
        case 56.25...78.75:
            return "East North East"
        case 78.75...101.25:
            return "East"
        case 101.25...123.75:
            return "East South East"
        case 123.75...146.25:
            return "South East"
        case 146.25...168.75:
            return "South South East"
        case 168.75...191.25:
            return "South"
        case 191.25...213.75:
            return "South South West"
        case 213.75...236.25:
            return "South West"
        case 236.25...258.75:
            return "West South West"
        case 258.75...281.25:
            return "West"
        case 281.25...303.75:
            return "West North West"
        case 303.75...326.25:
            return "North West"
        case 326.25...348.75:
            return "North North West"
            
        default:
            return "error"
        }
    }
}
