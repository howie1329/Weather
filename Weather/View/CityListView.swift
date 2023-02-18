//
//  CityListView.swift
//  Weather
//
//  Created by Howard Thomas on 2/18/23.
//

import SwiftUI

struct CityListView: View {
    var data = Data()
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack(alignment:.leading,spacing: 10){
                    ForEach(data.cityList,id: \.self){item in
                        NavigationLink(destination: CityView(cities: data.cities, cityList: data.cityList,currentCity: item), label: {
                            VStack{
                                Text(item)
                                    .bold()
                                    .font(.title2)
                                    .foregroundColor(.black)
                            }
                        })
                        Divider()
                    }
                }
                .padding()
            }
            .navigationTitle("ALL Cities")
        }
        .padding()
    }
}

struct CityListView_Previews: PreviewProvider {
    static var previews: some View {
        CityListView()
    }
}
