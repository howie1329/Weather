//
//  Forcast.swift
//  Weather
//
//  Created by Howard Thomas on 2/18/23.
//

import Foundation

struct Forcast: Decodable {
    
    var list: [List]?
}

struct List: Decodable {
    var main: Main?
}

