//
//  ContentView.swift
//  TISUI
//
//  Created by Miguel Rojas Cortes on 11/3/21.
//

import SwiftUI

struct ContentView: View {

    @State var counter = 0

    var body: some View {
        Button("Tap Me") { counter += 1 }
        LabelView(number: $counter)
            .debug()
    }

}

struct LabelView: View {

    @Binding var number: Int

    var body: some View {
        return Group {
            if number > 0 {
                Text("You have tapped \(number) times")
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
