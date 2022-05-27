//
//  EmojiMemoryGame.swift
//  mind
//
//  Created by Alex Baranov on 18.05.2022.
//
// ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
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

    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
