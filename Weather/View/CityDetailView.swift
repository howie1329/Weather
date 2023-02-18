//
//  CityDetailView.swift
//  Weather
//
//  Created by Howard Thomas on 2/18/23.
//

import SwiftUI

struct CityDetailView: View {
    @EnvironmentObject var model:CityWeatherModel
    var currentCity:String
    
    var body: some View {
        VStack{
            Text(currentCity)
            Text(model.maxTemp)
        }
        .navigationTitle("Detail View")
    }
}

struct CityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailView(currentCity: "New York")
            .environmentObject(CityWeatherModel())
    }
}
