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
            ZStack{
                BackgroundView(topColor: .blue, bottomColoer: .white)
                VStack{
                    Form{
                        Picker("Fav City", selection: $model.favCity){
                            Text("Pick Your Featured City")
                                .font(.title)
                            ForEach(data.cityList, id:\.self){
                                Text($0)
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                }
                .padding(.top)
                .navigationTitle("Profile Settings")
                .scrollContentBackground(.hidden)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(CityWeatherModel())
    }
}
