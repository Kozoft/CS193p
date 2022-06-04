//
//  mindApp.swift
//  mind
//
//  Created by Alex Baranov on 14.04.2021.
//

import SwiftUI

@main
struct mindApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
