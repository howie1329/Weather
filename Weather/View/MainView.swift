//
//  ContentView.swift
//  Weather
//
//  Created by Howard Thomas on 2/17/23.
//

import SwiftUI

struct MainView: View {
   @EnvironmentObject var model: CityWeatherModel
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                VStack{
                    Text("Feels Like \(model.feelsLike)")
                    Text(model.description)
                    Text(model.currentTemp)
                }
                

            }
            .navigationTitle("Weather Report")
        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(CityWeatherModel())
    }
}
