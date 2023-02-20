//
//  WeatherApp.swift
//  Weather
//
//  Created by Howard Thomas on 2/17/23.
//

import SwiftUI

@main
struct WeatherApp: App {
    @StateObject var model = CityWeatherModel()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(model)
        }
    }
}
