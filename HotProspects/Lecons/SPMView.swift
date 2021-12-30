//
//  SPMView.swift
//  HotProspects
//
//  Created by Giovanni Gaffé on 2021/12/30.
//

import SamplePackage
import SwiftUI

struct SPMView: View {
    let possibleNumbers = Array(1...60)
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
    
    var body: some View {
        Text(results)
    }
}

struct SPMView_Previews: PreviewProvider {
    static var previews: some View {
        SPMView()
    }
}
