//
//  ResultTypeView.swift
//  HotProspects
//
//  Created by Giovanni Gaffé on 2022/1/3.
//

import SwiftUI

struct ResultTypeView: View {
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    
    
    func fetchReadings() async {
        
        
        let fetchTask = Task { () -> String in
        
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings) readings."
        }
        
        let result = await fetchTask.result
        
        switch result {
        case .success(let success):
            output = success
        case .failure(let error):
            output = "download error: \(error.localizedDescription)"
        }
    }
}

struct ResultTypeView_Previews: PreviewProvider {
    static var previews: some View {
        ResultTypeView()
    }
}
