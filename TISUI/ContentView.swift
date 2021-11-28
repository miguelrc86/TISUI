//
//  ContentView.swift
//  TISUI
//
//  Created by Miguel Rojas Cortes on 11/3/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        LabelView()
            .debug()
    }

}

struct LabelView: View {
    
    @State var counter = 0

    var body: some View {
        VStack {
            Button("Tap Me") { counter += 1 }
            if counter > 0 {
                Text("You have tapped \(counter) times")
            }
        }
        .debug()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {

    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)

        return self
    }
}
