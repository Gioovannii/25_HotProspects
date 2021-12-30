//
//  ContextMenuView.swift
//  HotProspects
//
//  Created by Giovanni Gaffé on 2021/12/30.
//

import SwiftUI

struct ContextMenuView: View {
    @State private var backgrounColor = Color.red
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(backgrounColor)
                .cornerRadius(10)
            
            Text("Change color")
                .padding()
                .contextMenu {
                    Button {
                        backgrounColor = .red
                    } label: {
                        Text("Red")
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.red)
                    }
                    
                    Button {
                        backgrounColor = .green
                    } label: {
                        Text("Green")
                    }

                    
                    Button {
                        backgrounColor = .blue
                    } label: {
                        Text("Blue")
                    }

                }
             
        }
    }
}

struct ContextMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuView()
    }
}
