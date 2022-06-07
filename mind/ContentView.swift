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
        let newGradient = LinearGradient(
            gradient: Gradient(colors: [viewModel.color, viewModel.gradient]),
            startPoint: .top,
            endPoint: .bottom)
        VStack {
            HStack{
                Spacer()
                Text(viewModel.scoreToDisplay)
                Spacer()
                Text(viewModel.theme.name)
                Spacer()
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card, gradient: newGradient)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .padding()
            .foregroundColor(viewModel.color)
            Spacer()
            newGameButton()
        }
    }
    
    func newGameButton() -> some View {
        Button {
            viewModel.newGame()
        } label: {
            Text("New game")
        }
        .font(.largeTitle)
        .foregroundColor(viewModel.color)
    }
    
    struct CardView: View {
        let card: MemoryGame<String>.Card
        let gradient: LinearGradient
        
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
                    shape.fill(gradient)
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
                .preferredColorScheme(.light)
            //ContentView(viewModel: game)
            //    .preferredColorScheme(.dark)
        }
    }
}
