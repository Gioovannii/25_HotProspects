//
//  ResultTypeView.swift
//  HotProspects
//
//  Created by Giovanni Gaffé on 2021/12/29.
//

import SwiftUI

class DelayedUpdater: ObservableObject {
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }

    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct PublishingObservableView: View {
    @ObservedObject var updater = DelayedUpdater()

    var body: some View {
        Text("Value is: \(updater.value)")

    }
}

struct ResultTypeView_Previews: PreviewProvider {
    static var previews: some View {
        PublishingObservableView()
    }
}
