//
//  ContentView.swift
//  TISUI
//
//  Created by Miguel Rojas Cortes on 11/3/21.
//

import SwiftUI

struct ContentView: View {

    var counter = State(initialValue: 0)

    var body: some View {
        VStack {
            Button("Tap Moi") { counter.wrappedValue += 1 }
            LabelView(number: counter.projectedValue)
        }
        .debug()
    }

}

struct LabelView: View {

    @Binding var number: Int

    var body: some View {
        Group {
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
