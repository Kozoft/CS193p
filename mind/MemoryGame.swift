//
//  MemoryGame.swift
//  mind
//
//  Created by Alex Baranov on 18.05.2022.
//
// Model

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    
    private(set) var cards: Array<Card>
    private var upCardIndex: Int?
    private(set) var theme: Theme
    private(set) var score = 0
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = upCardIndex {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    if cards[chosenIndex].beenSeen {
                        score -= 1
                    }
                    if cards[potentialMatchIndex].beenSeen {
                        score -= 1
                    }
                    cards[chosenIndex].beenSeen = true
                    cards[potentialMatchIndex].beenSeen = true
                }
                upCardIndex = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                upCardIndex = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    init(themeToSetInTheGame: Theme, createCardContent: (Int) -> CardContent ){
        cards = Array<Card>()
        theme = themeToSetInTheGame
        var actualnumberOfPairs = theme.numberOfPairs
        if actualnumberOfPairs > theme.emojiSet.count {
            actualnumberOfPairs = theme.emojiSet.count
        }
        // add numberOfPairsOfCards*2 cards to card array
        for pairIndex in 0..<actualnumberOfPairs {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var beenSeen: Bool = false
        var content: CardContent
        var id: Int
    }
}
