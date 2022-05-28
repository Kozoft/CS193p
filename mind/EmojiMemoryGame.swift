//
//  EmojiMemoryGame.swift
//  mind
//
//  Created by Alex Baranov on 18.05.2022.
//
// ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    struct gameTheme {
        var name: String
        var numberOfPairs: Int
        var color: Color
        var emojiSet: Array<String>
    }
    
    // Add new theme here with a one line of code
    static let gameThemes: Array<gameTheme> = [
        gameTheme(name: "Cars", numberOfPairs: 5, color: .gray, emojiSet: ["🚲", "🚴🏻‍♀️", "🚳", "🚵🏻‍♀️", "🌀"]),
        gameTheme(name: "Planes", numberOfPairs: 6, color: .green, emojiSet: ["♲", "♳", "♽", "🙃", "♺", "♹"]),
        // less pairs than emojis
        gameTheme(name: "Stars 8", numberOfPairs: 7, color: .red, emojiSet: ["🚗", "🚙", "🏎", "🚕", "🚓", "🚘", "🚖", "🚔"]),
        // more pairs than emojis
        gameTheme(name: "Stripes 10", numberOfPairs: 10, color: .blue, emojiSet: ["⛴", "🛳", "🚢", "🏴‍☠️", "⚓️"]),
        gameTheme(name: "Joints", numberOfPairs: 6, color: .orange, emojiSet: ["🚀", "🛸", "📦", "🎡", "⚯", "𝌧"]),
        gameTheme(name: "Twixes all in", numberOfPairs: 8, color: .orange, emojiSet: [
                    "🚲", "🚴🏻‍♀️", "🚳", "🚵🏻‍♀️", "🌀", "♲", "♳", "♽", "🙃", "♺", "♹",
                    "🚗", "🚙", "🏎", "🚕", "🚓", "🚘", "🚖", "🚔", "🚠", "🚡", "🏁",
                    "⛴", "🛳", "🚢", "🏴‍☠️", "⚓️", "🚀", "🛸", "📦", "🎡", "⚯", "𝌧",]),
    ]
    
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
