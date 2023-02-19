//
//  ProfileView.swift
//  Weather
//
//  Created by Howard Thomas on 2/18/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var model:CityWeatherModel
    
    
    
    var data = Data()
    
    var body: some View {
        NavigationView{
            VStack{
                Section{
                    Picker("Fav City", selection: $model.favCity){
                        ForEach(data.cityList, id:\.self){
                            Text($0)
                        }
                    }.pickerStyle(.automatic)
                } header: {
                    Text("Featured City")
                }
            }
            .navigationTitle("Profile Settings")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(CityWeatherModel())
    }
}
