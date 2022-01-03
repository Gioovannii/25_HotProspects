//
//  SwipeActionsView.swift
//  HotProspects
//
//  Created by Giovanni Gaffé on 2022/1/3.
//

import SwiftUI

struct SwipeActionsView: View {
    var body: some View {
        List {
            Text("Taylor swift")
                .swipeActions {
                    Button(role: .destructive) {
                        print("Hi")
                    } label: {
                        Label("Send message", systemImage: "minus.circle")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        print("pinning")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

struct SwipeActionsView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeActionsView()
    }
}
