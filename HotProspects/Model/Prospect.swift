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
    fileprivate(set) var isContacted = false
}

class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        self.people = []
        getFakeData()
    }
    
    func getFakeData() {
        let prospect = Prospect()

        prospect.name = "Gaffé Giovanni"
        prospect.emailAdress = "gaffejonathan@ymail.com"
        people.append(prospect)
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
    }
}
