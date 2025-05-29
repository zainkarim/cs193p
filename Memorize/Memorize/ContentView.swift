//
//  ContentView.swift
//  Memorize
//
//  Created by Zain Karim on 5/22/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundColor(.orange) // Percolates down to CardView
    }
}

struct CardView: View {
    @State var isFaceUp = false
    // var isFaceUp: Bool = false // vars in structs MUST have values
    var body: some View {
        ZStack {
            // we can make local variables in @ViewBuilder
            // let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            // type inference
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                    .foregroundColor(.gray) // Specified stroke: otherwise would be orange
                Text("😎").font(.largeTitle)
            } else {
                base
            }
        } // View Modifier for when user taps on card
        .onTapGesture {
            // This is normal code! Not a @ViewBuilder
            // Views are immutable. To make isFaceUp = !isFaceUp, we'd have to use @State at the begininning of CardView to make a pointer to isFaceUp. This is typically only used for things like animation and NOT game logic, but we'll use it for now.
            isFaceUp = !isFaceUp
            if isFaceUp {
                print("Face up")
            } else {
                print("Face down")
            }
        }
    }
}

#Preview {
    ContentView()
}
