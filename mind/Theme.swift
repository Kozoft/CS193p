//
//  Theme.swift
//  mind
//
//  Created by Alex Baranov on 05.06.2022.
//

import Foundation

struct Theme {
    var name: String
    var numberOfPairs: Int
    var color: String
    var gradient: String?
    var emojiSet: Array<String>
    
    init(name: String,
         numberOfPairs: Int? = nil,
         color: String,
         gradient: String? = nil,
         emojiSet: Array<String>,
         randomNumberOfPairs: Bool = false) {
        self.name = name
        if let newNumberOfPairs = numberOfPairs {
            self.numberOfPairs = newNumberOfPairs
        } else {
            self.numberOfPairs = emojiSet.count
        }
        if randomNumberOfPairs {
            self.numberOfPairs = Int.random(in: 2..<emojiSet.count)
        }
        self.color = color
        if let newGradient = gradient {
            self.gradient = newGradient
        }
        self.emojiSet = emojiSet
    }
}
