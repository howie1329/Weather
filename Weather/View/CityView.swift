//
//  CityView.swift
//  Weather
//
//  Created by Howard Thomas on 2/18/23.
//

import SwiftUI

struct CityView: View {
    
    @EnvironmentObject var model:CityWeatherModel
    var cities:[String:[Double]]
    var cityList:[String]
    
    @State var featuredView = false
    @State var showDetailView = false
    @State var currentCity = ""
    
    var body: some View {
        VStack(alignment:.center){
            
            Spacer()
            
            if featuredView{
                Text(model.favCity)
                    .font(.system(size: 50, weight: .bold))
                    .padding(.bottom,5)
            }
            else{
                Text(currentCity)
                    .font(.system(size: 50, weight: .bold))
                    .padding(.bottom,5)
            }
            VStack(alignment:.center,spacing: 50){
                VStack{
                    HStack{
                        Text("\(model.currentTemp)°")
                            .font(.system(size: 60, weight: .bold))
                        Text("Feels Like: \(model.feelsLike)°")
                            .font(.subheadline)
                            .bold()
                    }
                    Text(model.description)
                        .bold()
                        .font(.system(size: 30))
                    Text("Min: \(model.minTemp)° Max: \(model.maxTemp)°")
                        .font(.subheadline)
                }
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

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        var data = Data()
        CityView(cities: data.cities, cityList: data.cityList)
            .environmentObject(CityWeatherModel())
    }
}
