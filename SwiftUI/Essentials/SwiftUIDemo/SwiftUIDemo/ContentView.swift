//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Hailey on 2022/02/27.
//

import SwiftUI

struct ContentView: View {

    var colors: [Color] = [.black, .red, .green, .blue]
    var colorNames: [String] = ["Black", "Red", "Green", "Blue"]

    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Welcome to SwiftUI"

    var body: some View {
        VStack {
            Spacer()
            Text(text)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(self.rotation))
                .animation(.easeInOut, value: 5)
                .foregroundColor(colors[colorIndex])

            Spacer()
            Divider()

            Slider(value: $rotation, in: 0...360, step: 0.1)
                .padding()

            TextField("Enter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Picker(selection: $colorIndex, label: Text("Color")) {
                ForEach (0 ..< colorNames.count) {
                    Text(self.colorNames[$0])
                        .foregroundColor(self.colors[$0])
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
