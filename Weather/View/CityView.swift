//
//  CityView.swift
//  Weather
//
//  Created by Howard Thomas on 2/18/23.
//

import SwiftUI

struct CityView: View {
    
    var model:CityWeatherModel
    var cities:[String:[Double]]
    var cityList:[String]
    @State var currentCity = "New York"
    
    var body: some View {
        VStack(alignment:.center){
            HStack{
                Picker("City", selection: $currentCity) {
                    ForEach(cityList, id:\.self){item in
                        Text(item)
                    }
                }.onChange(of: currentCity) { newValue in
                    model.getWeather(lat: cities[currentCity]![0], long: cities[currentCity]![1])
                }.pickerStyle(.segmented)
            }
            
            Spacer()
            
            Text(currentCity)
                .font(.system(size: 50, weight: .bold))
                .padding(.bottom,5)
            
            VStack(alignment:.center){
                HStack{
                    Text("\(model.currentTemp)°")
                        .font(.system(size: 60, weight: .bold))
                    Text("Feels Like: \(model.feelsLike)°")
                        .font(.subheadline)
                        .bold()
                }
                Text(model.description)
                    .font(.system(size: 30))
                Text("Min: \(model.minTemp)° Max: \(model.maxTemp)°")
                
            }
            
            Spacer()
            Spacer()
        }
        .padding()
    }
}

