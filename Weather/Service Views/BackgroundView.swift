//
//  BackgroundView.swift
//  Weather
//
//  Created by Howard Thomas on 2/22/23.
//

import SwiftUI

struct BackgroundView: View {
    var topColor:Color
    var bottomColoer:Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor,bottomColoer]), startPoint: .topTrailing, endPoint: .bottomLeading)
            .ignoresSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(topColor: .blue, bottomColoer: .white)
    }
}
