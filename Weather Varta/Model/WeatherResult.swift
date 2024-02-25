//
//  Weather.swift
//  Weather Varta
//
//  Created by Aman Bind on 10/02/24.
//

import Foundation

struct WeatherResult: Codable {
    var weather: [Weather]
    var main: Temperature
    var wind: Wind
    var clouds: Cloud
    var sys: System
    var name: String
    var id: Int
}

struct Weather: Codable {
    var id: Int
    var description: String
    var icon: String
}

struct Temperature: Codable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Int
    var humidity: Int
}

struct Wind: Codable {
    var speed: Double
    var deg: Double
}

struct Cloud: Codable {
    var all: Int
}

struct System: Codable {
    var country: String
    var sunrise: Double
    var sunset: Double
}
