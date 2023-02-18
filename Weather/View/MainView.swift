//
//  ContentView.swift
//  Weather
//
//  Created by Howard Thomas on 2/17/23.
//

import SwiftUI

struct MainView: View {
    var data = Data()
    
    var body: some View {
        CityView(cities: data.cities, cityList: data.cityList)
            .background(Color.blue)
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(CityWeatherModel())
    }
}
