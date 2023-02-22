//
//  MainTabView.swift
//  Weather
//
//  Created by Howard Thomas on 2/18/23.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var model:CityWeatherModel
    
    @State var profileVisable = false
    
    var data = Data()
    
    var body: some View {
        NavigationView{
            TabView {
                CityView(featuredView: true, currentCity: model.favCity)
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
            .toolbar{
                Button(action: {profileVisable.toggle()}, label: {Image(systemName: "person.crop.circle")}).sheet(isPresented: $profileVisable,onDismiss: {model.getWeather(lat: Data().cities[model.favCity]![0], long: Data().cities[model.favCity]![1])}, content: {ProfileView()})
            }
            .foregroundColor(Color.black)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(CityWeatherModel())
    }
}
