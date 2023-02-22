//
//  CityView.swift
//  Weather
//
//  Created by Howard Thomas on 2/18/23.
//

import SwiftUI

struct CityView: View {
    
    @EnvironmentObject var model:CityWeatherModel
    
    @State var featuredView = false
    @State var showDetailView = false
    @State var currentCity = ""
    
    var body: some View {
        ZStack{
            
            BackgroundView(topColor: .blue, bottomColoer: .white)
            
            VStack(alignment:.center,spacing: 15){
                VStack{
                    if featuredView{
                        Text(model.favCity)
                            .font(.system(size: 50, weight: .bold))
                    }
                    else{
                        Text(currentCity)
                            .font(.system(size: 50, weight: .bold))
                    }
                }
                .padding(.top,200)
                VStack(alignment:.center){
                    VStack(spacing:10){
                        Text("\(model.currentTemp)°")
                            .font(.system(size: 60, weight: .bold))
                        
                        Text("Min: \(model.minTemp)° Max: \(model.maxTemp)°")
                            .font(.subheadline)
                            .bold()
                        
                        Gauge(value: Float(model.currentTemp) ?? 0.0, in: 0...100){}
                            .gaugeStyle(.accessoryLinear)
                        
                        Text("Feels Like: \(model.feelsLike)°")
                            .font(.subheadline)
                            .bold()
                        
                        Text(model.description.capitalized)
                            .bold()
                            .font(.system(size: 30))
                    }
                    Spacer()
                    Button("Tap For Details"){
                        showDetailView.toggle()
                    }.sheet(isPresented: $showDetailView) {
                        if featuredView{
                            CityDetailView(currentCity: model.favCity)
                        }
                        else{
                            CityDetailView(currentCity: currentCity)
                        }
                        
                    }
                    .foregroundColor(.black)
                    .buttonStyle(.bordered)
                    
                }
                .padding()
                .onAppear(){
                    if featuredView {
                        model.getWeather(lat: Data().cities[model.favCity]![0], long: Data().cities[model.favCity]![1])
                        currentCity = model.favCity
                    }
                    else{
                        model.getWeather(lat: Data().cities[currentCity]![0], long: Data().cities[currentCity]![1])
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {

        var model = CityWeatherModel()
        CityView()
            .environmentObject(model)
    }
}
