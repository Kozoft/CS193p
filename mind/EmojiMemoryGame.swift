//
//  EmojiMemoryGame.swift
//  mind
//
//  Created by Alex Baranov on 18.05.2022.
//
// ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    // Add new theme here with a one line of code
    static var themes: Array<Theme> = [
        Theme(name: "Cars", numberOfPairs: 5, color: "gray",
                  emojiSet: ["🚲", "🚴🏻‍♀️", "🚳", "🚵🏻‍♀️", "🌀"]),
        Theme(name: "Planes", numberOfPairs: 6, color: "skyBlue",
                  emojiSet: ["♲", "♳", "♽", "🙃", "♺", "♹"]),
        // less pairs than emojis
        Theme(name: "Stars 8", numberOfPairs: 4, color: "red",
                  emojiSet: ["🚗", "🚙", "🏎", "🚕", "🚓", "🚘", "🚖", "🚔"]),
        // more pairs than emojis
        Theme(name: "Stripes 10", numberOfPairs: 50, color: "blue",
                  emojiSet: ["⛴", "🛳", "🚢", "🏴‍☠️", "⚓️"]),
        // wrong color
        Theme(name: "Joints", numberOfPairs: 3, color: "fuchsia",
                  emojiSet: ["🚀", "🛸", "📦", "🎡", "⚯", "𝌧"]),
        // all emojis available
        Theme(name: "Twixes all in", numberOfPairs: 8, color: "orange",
                  emojiSet: [
                    "🚲", "🚴🏻‍♀️", "🚳", "🚵🏻‍♀️", "🌀", "♲", "♳", "♽", "🙃", "♺", "♹",
                    "🚗", "🚙", "🏎", "🚕", "🚓", "🚘", "🚖", "🚔", "🚠", "🚡", "🏁",
                    "⛴", "🛳", "🚢", "🏴‍☠️", "⚓️", "🚀", "🛸", "📦", "🎡", "⚯", "𝌧",]),
    ]
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        print("Theme: \(theme.name)")
        var themeToSet = theme
        themeToSet.emojiSet.shuffle()
        return MemoryGame<String>(themeToSetInTheGame: themeToSet) { pairIndex in
            theme.emojiSet[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame(theme: themes.randomElement()!)
        
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var theme: Theme {
        model.theme
    }
    
    var scoreToDisplay: String {
        String(model.score)
    }
    
    var color: Color {
        switch theme.color {
        case "gray": return .gray
        case "green": return .green
        case "red": return .red
        case "blue": return .blue
        case "orange": return .orange
        case "black": return .black
        case "brown": return .brown
        case "clear": return .clear
        case "white": return .white
        case "cyan": return .cyan
        case "indigo": return .indigo
        case "mint": return .mint
        case "pink": return .pink
        case "purple": return .purple
        case "teal": return .teal
        case "skyBlue": return Color(red: 0.4627, green: 0.8392, blue: 1.0)
        case "lemonYellow": return Color(hue: 0.1639, saturation: 1, brightness: 1)
        case "steelGray": return Color(white: 0.4745)
        default : return .black
        }
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame(theme: EmojiMemoryGame.themes.randomElement()!)
    }
}
