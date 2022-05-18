//
//  ContentView.swift
//  mind
//
//  Created by Alex Baranov on 14.04.2021.
//

import SwiftUI

struct ContentView: View {
    var emojis = [
        ["🚲", "🚴🏻‍♀️", "🚳", "🚵🏻‍♀️", "🌀", "♲", "♳", "♽","🙃","♺","♹"],
        ["🚗", "🚙", "🏎", "🚕", "🚓", "🚘", "🚖", "🚔","🚠","🚡","🏁"],
        ["⛴", "🛳", "🚢", "🏴‍☠️", "⚓️", "🚀", "🛸", "📦","🎡","⚯","𝌧"],
    ]
    @State var emojiCount = 8
    @State var emojiSetIndex = 0
    var body: some View {
        VStack {
            Text("Memorize!").font(.title)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(cardCount: emojiCount)))]) {
                    let randomEmojis = emojis[emojiSetIndex].shuffled()
                    ForEach(randomEmojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .padding()
            .foregroundColor(.orange)
            Spacer()
            HStack {
                Spacer()
                bottomButton(index: 0, name: "bicycle", underName: "Bicycles")
                Spacer()
                bottomButton(index: 1, name: "car", underName: "Cars")
                Spacer()
                bottomButton(index: 2, name: "ferry", underName: "Ships")
                Spacer()
            }
            .padding(.horizontal)
        }
        .font(.largeTitle)
    }
    
    func widthThatBestFits(cardCount: Int) -> CGFloat {
        return CGFloat(15*(emojis[emojiSetIndex].count-cardCount)+30)
    }
    
    func bottomButton(index: Int, name: String, underName: String) -> some View {
        VStack() {
            Button
            {
                emojiSetIndex = index
                emojiCount = Int.random(in: 4...11)
            } label: {
                Image(systemName: name)
            }.font(.largeTitle)
            Text(underName).font(.footnote).foregroundColor(.blue)
        }
    }
    
    var addCard: some View {
        Button{
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    struct CardView: View {
        var content: String
        @State var isFaceUp: Bool = true
        var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 10.0)
                if isFaceUp {
                    shape.fill(Color.white)
                    shape.strokeBorder(lineWidth: 3.0)
                    Text(content)
                } else {
                    shape.fill()
                }
            }.onTapGesture {
                isFaceUp = !isFaceUp
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .preferredColorScheme(.light)
                .previewInterfaceOrientation(.portrait)
            //ContentView()
                //.preferredColorScheme(.dark)
        }
    }
}
