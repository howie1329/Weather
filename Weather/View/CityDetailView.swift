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
        NavigationView{
            VStack(spacing:10){
                VStack(spacing:10){
                    Text(currentCity)
                        .font(.system(size: 45, weight: .bold))
                    HStack(spacing:30){
                        Text("\(model.currentTemp)°")
                        Text(model.simpleDescription)
                    }
                    .bold()
                    .font(.title)
                }
                .padding(.bottom,5)
                Text(model.description)
                    .bold()
                HStack(spacing:10){
                    VStack(spacing:10){
                        Text("Min Temp: \(model.minTemp)°")
                        Text("Max Temp: \(model.maxTemp)°")
                        
                        
                    }
                    VStack(spacing:10){
                        Text("Feels Like: \(model.feelsLike)°")
                        Text("Wind Speed: \(model.windSpeed) mph")
                    }
                }
                .bold()
                .font(.headline)
                .navigationTitle("Detail View")
            }
            
        }
    }
}

struct CityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailView(currentCity: "New York")
            .environmentObject(CityWeatherModel())
    }
}
