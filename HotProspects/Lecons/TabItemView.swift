//
//  TabView.swift
//  HotProspects
//
//  Created by Giovanni Gaffé on 2021/12/28.
//

import SwiftUI

struct TabItemView: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
            
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")

        }
    }
}

struct TabItemView_Previews: PreviewProvider {
    static var previews: some View {
        TabItemView()
    }
}
