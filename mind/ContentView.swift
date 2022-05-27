//
//  ContentView.swift
//  mind
//
//  Created by Alex Baranov on 14.04.2021.
//
// View

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
    
    struct CardView: View {
        let card: MemoryGame<String>.Card
        
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
            ContentView(viewModel: game)
                .preferredColorScheme(.light)
                .previewInterfaceOrientation(.portrait)
            ContentView(viewModel: game)
                .preferredColorScheme(.dark)
        }
    }
}
