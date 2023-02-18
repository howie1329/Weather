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
    @State var showDetailView = false
    @State var currentCity = "New York"
    
    var body: some View {
        VStack(alignment:.center){
            
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
                
                Spacer()
                
                Button("Tap For Details"){
                    showDetailView.toggle()
                }.sheet(isPresented: $showDetailView) {
                    CityDetailView()
                }
                .foregroundColor(.black)
                .buttonStyle(.bordered)


            }
            
            Spacer()
        }
        .padding(.top,200)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        var data = Data()
        CityView(cities: data.cities, cityList: data.cityList)
            .environmentObject(CityWeatherModel())
    }
}
