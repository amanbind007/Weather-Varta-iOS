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
}

struct Temperature: Codable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Double
    var humidity: Double
}

struct Wind: Codable {
    var speed: Double
    var deg: Int
}

struct Cloud: Codable {
    var all: Int
}

struct System: Codable {
    var country: String
}
