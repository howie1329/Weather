//
//  ContentView.swift
//  Weather
//
//  Created by Howard Thomas on 2/17/23.
//

import SwiftUI

struct MainView: View {
    var model = CityWeatherModel()
    var body: some View {
        VStack {
            Button {
                model.getWeather()
            } label: {
                Text("Press Me")
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
