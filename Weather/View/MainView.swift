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
        ZStack(alignment:.top){
            Rectangle()
                .foregroundColor(.blue)
            CityView(cities: data.cities, cityList: data.cityList)
            
            
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(CityWeatherModel())
    }
}
