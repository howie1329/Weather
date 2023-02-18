//
//  ContentView.swift
//  Weather
//
//  Created by Howard Thomas on 2/17/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var model: CityWeatherModel
    var data = Data()
    
    @State var currentCity = "New York"
    
    var body: some View {
        ZStack(alignment:.top){
            Rectangle()
                .foregroundColor(.blue)
            CityView(model: model, cities: data.cities, cityList: data.cityList)
            
            
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(CityWeatherModel())
    }
}
