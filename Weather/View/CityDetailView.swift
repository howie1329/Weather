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
            ZStack(alignment:.top){
                BackgroundView(topColor: .blue, bottomColoer: .white)
                VStack{
                    VStack(spacing:20){
                        Text(currentCity)
                            .font(.system(size: 45, weight: .bold))
                        VStack{
                            Text("\(model.currentTemp)°")
                                .font(.system(size: 70,weight: .bold))
                            Text(model.description.capitalized)
                                .font(.system(size: 30))
                        }
                    }
                    .padding(.bottom,55)
                    VStack(spacing:30){
                        HStack(spacing:50){
                            Text("Min Temp: \(model.minTemp)°")
                            Text("Max Temp: \(model.maxTemp)°")
                            
                            
                        }
                        HStack(spacing:50){
                            Text("Feels Like: \(model.feelsLike)°")
                            Text("Wind Speed: \(model.windSpeed) mph")
                        }
                        
                        Gauge(value: Float(model.currentTemp) ?? 0.0,in: (Float(model.minTemp) ?? 0.0)...(Float(model.maxTemp) ?? 0.0)) {
                        } currentValueLabel: {
                        } minimumValueLabel: {
                            Text("\(model.minTemp)")
                        } maximumValueLabel: {
                            Text("\(model.maxTemp)")
                        }
                        
                    }
                    .bold()
                    .font(.headline)
                    .padding()
                    .navigationTitle("\(currentCity)'s Detail View")
                }.padding(.top,90)
                
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
