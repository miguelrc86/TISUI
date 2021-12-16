//
//  ContentView.swift
//  TISUI
//
//  Created by Miguel Rojas Cortes on 11/3/21.
//

import SwiftUI

struct KnobShape: Shape {

    var pointerSize: CGFloat = 0.1
    var pointerWidth: CGFloat = 0.1

    func path(in rect: CGRect) -> Path {
        let pointerHeight = rect.height * pointerSize
        let pointerWidth = rect.width * self.pointerWidth
        let circleRect = rect.insetBy(dx: pointerHeight, dy: pointerHeight)

        return Path { p in
            p.addEllipse(in: circleRect)
            p.addRect(CGRect(x: circleRect.midX - pointerWidth / 2,
                             y: 2,
                             width: pointerWidth,
                             height: pointerHeight))
        }
    }
}

struct Knob: View {

    @Binding var value: Double

    var body: some View {
        KnobShape()
            .fill(Color.orange)
            .rotationEffect(Angle(degrees: value * 345))
            .onTapGesture {
                self.value = self.value < 0.5 ? 1 : 0
            }
    }
}

struct ContentView: View {
    
    @State var volume: Double = 0

    var body: some View {
        VStack {
            Knob(value: $volume)
                .frame(width: 100, height: 100)
            Slider(value: $volume, in: 0...1)
                .padding()
            Text(String(format: "%.2f", volume))
        }
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
