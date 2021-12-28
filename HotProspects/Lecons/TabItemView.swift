//
//  TabView.swift
//  HotProspects
//
//  Created by Giovanni Gaffé on 2021/12/28.
//

import SwiftUI

struct TabItemView: View {
    var body: some View {
        TabView {
            Text("Tab 1")
                .tabItem {
                    Image(systemName: "star")
                    Text("One")
                }
            Text("Tab 2")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Two")
                }

        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabItemView()
    }
}
