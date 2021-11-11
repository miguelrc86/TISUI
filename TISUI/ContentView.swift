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
        VStack {
            Button(action: { counter += 1 }) {
                Text("Tap me")
                    .padding()
                    .background(Color(.tertiarySystemFill))
                    .cornerRadius(5)
            }

            if counter > 0 {
                Text("You have tapped \(counter) times")
            } else {
                Text("You have not yet tapped")
            }
        }.debug()
            .frame(width: 200, height: 200)
            .border(Color.black)
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
