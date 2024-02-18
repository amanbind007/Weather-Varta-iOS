//
//  Weather.swift
//  Weather Varta
//
//  Created by Aman Bind on 10/02/24.
//

import Foundation

struct Result: Codable {
    var weather: Weather
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
    var temp: Decimal
    var feels_like: Decimal
    var temp_min: Decimal
    var temp_max: Decimal
    var pressure: Decimal
    var humidity: Decimal
}

struct Wind: Codable {
    var speed: Decimal
    var degree: Int
}

struct Cloud: Codable {
    var all: Int
}

struct System: Codable {
    var country: String
}
