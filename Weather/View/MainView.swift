//
//  ContentView.swift
//  Weather
//
//  Created by Howard Thomas on 2/17/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var model: CityWeatherModel
    
    var cityList = ["New York","Dallas","Seattle"]
    var cities = ["New York":[40.730610,-73.935242],"Dallas":[32.779167,-96.808891],"Seattle":[47.608013,-122.335167]]
    @State var currentCity = "New York"
    
    var body: some View {
        ZStack(alignment:.top){
            Rectangle()
                .foregroundColor(.blue)
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
                        Text(model.currentTemp)
                            .font(.system(size: 60, weight: .bold))
                        Text("Feels Like: \(model.feelsLike)")
                            .font(.subheadline)
                            .bold()
                    }
                    Text(model.description)
                        .font(.system(size: 30))
                    Text("Min: \(model.minTemp) Max: \(model.maxTemp) ")
                }
                Spacer()
                Spacer()
            }
            .padding()
            
            
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(CityWeatherModel())
    }
}
