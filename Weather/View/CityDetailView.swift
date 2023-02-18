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
        VStack(spacing:30){
            HStack(spacing:30){
                Text(currentCity)
                Text("\(model.currentTemp)°")
                Text(model.simpleDescription)
            }
            .bold()
            .font(.title)
            HStack{
                VStack(spacing:10){
                    Text("Feels Like: \(model.feelsLike)°")
                    Text("Min Temp: \(model.minTemp)°")
                }
                Text(model.description)
                VStack(spacing:10){
                    Text("Max Temp: \(model.maxTemp)°")
                    Text("Wind Speed: \(model.windSpeed) mph")
                }
            }
            .bold()
            .font(.headline)
  
        }
        .padding()
        .navigationTitle("Detail View")
    }
}

struct CityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailView(currentCity: "New York")
            .environmentObject(CityWeatherModel())
    }
}
