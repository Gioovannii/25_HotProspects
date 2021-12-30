//
//  Prospect.swift
//  HotProspects
//
//  Created by Giovanni Gaffé on 2021/12/30.
//

import Foundation

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAdress = ""
    var isContacted = false
}

class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        self.people = []
    }
}
