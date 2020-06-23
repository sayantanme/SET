//
//  SetCardGame.swift
//  SET
//
//  Created by Sayantan Chakraborty on 21/06/20.
//  Copyright © 2020 Sayantan Chakraborty. All rights reserved.
//

import Foundation

enum CardShape: CaseIterable {
    case oval
    case squiggles
    case diamond
}

enum CardColor: CaseIterable {
    case red
    case purple
    case green
}

enum CardNumber: Int, CaseIterable {
    case one = 1
    case two = 2
    case three = 3
}

enum CardShading: CaseIterable {
    case solid
    case striped
    case outlined
}

struct SetCardgame<CardContent> where CardContent : Equatable {
    var cards: [Card]
    
    struct Card: Identifiable {
        var id : Int
        var isMatched: Bool = false
        var isFaceUp: Bool = true
        var content : CardContent
        var shape: CardShape
        var color: CardColor
        var number: CardNumber
        var shading: CardShading
        
    }
    
    init(cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        var index = 0
        for number in CardNumber.allCases {
            for shape in CardShape.allCases {
                for color in CardColor.allCases {
                    for shading in CardShading.allCases {
                        let content = cardContentFactory(index)
                        cards.append(Card(id: index, content: content, shape: shape, color: color, number: number, shading: shading))
                        index = index + 1
                    }
                }
            }
            
        }
        cards = cards.shuffled()
        print("Total cards : \(cards.count)")
    }
}
