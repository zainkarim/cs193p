//
//  ContentView.swift
//  Memorize
//
//  Created by Zain Karim on 5/22/25.
//

import SwiftUI

struct ContentView: View {
    // create emojis array
    let emojis: [String] = ["😎", "🤓", "😆", "😋", "🥹", "🥸", "🥳", "🤩", "🤯"]
    // create card count variable to change how many cards are visisble
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            cards
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        HStack {
            // Can't do for loops in @ViewBuilder! How would we approach this?
            // Use a ForEach struct: "give me the view you want for each of these things."
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cardRemover: some View {
        // Button to remove cards
        Button(action: {
            if(cardCount > 1) {
                cardCount -= 1
                print("Removed card")
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.minus")
        })
    }
    
    var cardAdder: some View {
        // Button to add cards
        Button(action: {
            if(cardCount < emojis.count) {
                cardCount += 1
                print("Added card")
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.plus")
        })
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
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
                Text(content).font(.largeTitle)
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
