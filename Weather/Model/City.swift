//
//  City.swift
//  Weather
//
//  Created by Howard Thomas on 2/17/23.
//

import Foundation

struct City: Decodable{
    
    var weather: [Weather]?
    var main: Main?
    var wind: Wind?
}

struct Weather: Decodable, Identifiable {
    
    var id: Int?
    var main: String?
    var description: String?
}

struct Main: Decodable{
    
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
}

struct Wind: Decodable{
    
    var speed: Double?
    var deg: Int?
    var gust: Double?
}
