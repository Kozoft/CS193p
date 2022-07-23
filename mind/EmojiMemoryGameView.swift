//
//  EmojiMemoryGameView.swift
//  mind
//
//  Created by Alex Baranov on 14.04.2021.
//
// View

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(game.cards) { card in
                    CardView(card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
    
    struct CardView: View {
        private let card: EmojiMemoryGame.Card
        
        init(_ card: EmojiMemoryGame.Card) {
            self.card = card
        }
        
        var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 10.0)
                if card.isFaceUp {
                    shape.fill(Color.white)
                    shape.strokeBorder(lineWidth: 3.0)
                    Text(card.content).font(.largeTitle)
                } else if card.isMatched {
                    shape.opacity(0.0)
                } else {
                    shape.fill()
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(game: game)
                .preferredColorScheme(.light)
                .previewInterfaceOrientation(.portrait)
            EmojiMemoryGameView(game: game)
                .preferredColorScheme(.dark)
        }
    }
}
