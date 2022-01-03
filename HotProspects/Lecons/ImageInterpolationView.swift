//
//  ImageInterpolationView.swift
//  HotProspects
//
//  Created by Giovanni Gaffé on 2021/12/29.
//

import SwiftUI

struct ImageInterpolationView: View {
    var body: some View {
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(Color.black)
            .ignoresSafeArea()
    }
}

struct ImageInterpolationView_Previews: PreviewProvider {
    static var previews: some View {
        ImageInterpolationView()
    }
}
