//
//  MainTabView.swift
//  Weather
//
//  Created by Howard Thomas on 2/18/23.
//

import SwiftUI

struct MainTabView: View {
    var data = Data()
    
    var body: some View {
        TabView {
            CityView(cities: data.cities, cityList: data.cityList)
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            CityListView()
                .tabItem {
                    VStack{
                        Image(systemName: "globe.americas")
                        Text("Cities")
                    }
                }
        }
        .foregroundColor(Color.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(CityWeatherModel())
    }
}
