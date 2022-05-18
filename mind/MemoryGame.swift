//
//  MemoryGame.swift
//  mind
//
//  Created by Alex Baranov on 18.05.2022.
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    func choose(_ card: Card) {
        
    }
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        // add numberOfPairsOfCards*2 cards to card array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
