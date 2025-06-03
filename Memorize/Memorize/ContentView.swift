//
//  ContentView.swift
//  Memorize
//
//  Created by Zain Karim on 5/22/25.
//

import SwiftUI

struct ContentView: View {
    // create emojis array
    @State var emojis: Array<String> = []
    
    // create themes
    var faces: [String] = ["😎", "🤓", "😆", "🥳", "🤩", "🤯", "😎", "🤓", "😆", "🥳", "🤩", "🤯"]
    var vehicles: [String] = ["🚀", "🚕", "🛸", "🛵", "🏎️", "✈️", "🚀", "🚕", "🛸", "🛵", "🏎️", "✈️"]
    var objects: [String] = ["🍎", "📸", "🎸", "💻", "🎨", "🍰", "🍎", "📸", "🎸", "💻", "🎨", "🍰"]

    // create card count variable to change how many cards are visisble
    @State var cardCount: Int = 0
    
    var body: some View {
        VStack {
            title
            ScrollView{
            cards
            }
            Spacer()
            /* cardCountAdjuster */
            themePickers
        }
        .padding()
    }

    var title: some View {
        Text("Memorize!").font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            // Can't do for loops in @ViewBuilder! How would we approach this?
            // Use a ForEach struct: "give me the view you want for each of these things."
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
                
            }
        }
        .foregroundColor(.orange)
    }
    
    var themePickers: some View {
        HStack{
            Spacer()
            facesTheme
            Spacer()
            vehiclesTheme
            Spacer()
            objectsTheme
            Spacer()
        }
        .font(.title2)
    }
    
    func themePicker(theme: Array<String>, symbol: String, label: String) -> some View {
        Button(action: {
            emojis = theme.shuffled()
            cardCount = emojis.count
        }, label: {
            VStack{
                Image(systemName: symbol)
                    .imageScale(.large)
                Text(label)
                    .font(.body)
            }
        })
    }
    
    var facesTheme: some View {
        themePicker(theme: faces, symbol: "face.smiling", label: "Faces")
    }
    var vehiclesTheme: some View {
        themePicker(theme: vehicles, symbol: "car", label: "Vehicles")
    }
    var objectsTheme: some View {
        themePicker(theme: objects, symbol: "cube", label: "Objects")
    }
    
    /*
    var cardCountAdjusters: some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    */
    /*
        // Create functions to add and remove cards
        func cardCountAdjuster(by offset : Int, symbol: String) -> some View {
            Button(action: {
                cardCount += offset
                print("Removed card")
            }, label: {
                Image(systemName: symbol)
            })
            .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
        }
        
        // Calling the cardCountAdjuster function
        var cardRemover: some View {
            cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus")
        }
        var cardAdder: some View {
            cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus")
        }
    */
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    // var isFaceUp: Bool = false // vars in structs MUST have values
    
    var body: some View {
        ZStack {
            // we can make local variables in @ViewBuilder
            // let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            // type inference
            let base = RoundedRectangle(cornerRadius: 12)
            // Make emojis transparent when facedown
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                    .foregroundColor(.gray) // Specified stroke: otherwise would be orange
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
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
