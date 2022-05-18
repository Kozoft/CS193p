//
//  EmojiMemoryGame.swift
//  mind
//
//  Created by Alex Baranov on 18.05.2022.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = [
        "🚲", "🚴🏻‍♀️", "🚳", "🚵🏻‍♀️", "🌀", "♲", "♳", "♽", "🙃", "♺", "♹",
        "🚗", "🚙", "🏎", "🚕", "🚓", "🚘", "🚖", "🚔", "🚠", "🚡", "🏁",
        "⛴", "🛳", "🚢", "🏴‍☠️", "⚓️", "🚀", "🛸", "📦", "🎡", "⚯", "𝌧",
    ]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }

    private(set) var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
