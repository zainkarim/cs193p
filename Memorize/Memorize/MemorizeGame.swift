//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Zain Karim on 6/3/25.
//

import Foundation

struct MemoryGame<CardContent> {
    
    // What does the model do? What kind of data does it have associated with it?
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    // Card struct is INSIDE of MemoryGame
    // This Card belongs to MemoryGame
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
    }
}
