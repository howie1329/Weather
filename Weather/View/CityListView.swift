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
        ZStack(alignment:.top){
            BackgroundView(topColor: .blue, bottomColoer: .white)
            Text("All Cities")
                .font(.system(size: 35,weight: .bold))
            ScrollView{
                LazyVStack(alignment:.leading,spacing: 10){
                    ForEach(data.cityList,id: \.self){item in
                        NavigationLink(destination: CityView(currentCity: item), label: {
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
                .padding([.top,.horizontal],25)
            }.padding(.top,50)
        }
    }
}

struct CityListView_Previews: PreviewProvider {
    static var previews: some View {
        CityListView()
    }
}
