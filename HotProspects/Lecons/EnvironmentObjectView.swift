//
//  EnvironmentObjectView.swift
//  HotProspects
//
//  Created by Giovanni Gaffé on 2021/12/28.
//

import SwiftUI

class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}


struct EnvironmentObjectView: View {
    let user = User()
    
    var body: some View {
        VStack {
            EditView()
            DisplayView()
                
        }
        .environmentObject(user)
    }
}

struct EnvironmentObjectView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectView()
    }
}
