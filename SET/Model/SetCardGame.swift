//
//  SetCardGame.swift
//  SET
//
//  Created by Sayantan Chakraborty on 21/06/20.
//  Copyright © 2020 Sayantan Chakraborty. All rights reserved.
//

import Foundation

enum CardShape: CaseIterable,Equatable {
    case oval
    case squiggles
    case diamond
}

enum CardColor: CaseIterable,Equatable {
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

struct SetCardgame {
    private var cards: [Card]
    private(set) var currentlyPlayingCards = [Card]()
    var isMatch = false
    
    struct Card: Identifiable {
        var id : Int
        var isMatched: Bool = false
        var isSelected: Bool = false
        //var content : CardContent
        var shape: CardShape
        var color: CardColor
        var number: CardNumber
        var shading: CardShading
        var isAlreadyShown: Bool = false
    }
    
    init(cardContentFactory: (Int) -> Void) {
        cards = [Card]()
        var index = 0
        for number in CardNumber.allCases {
            for shape in CardShape.allCases {
                for color in CardColor.allCases {
                    for shading in CardShading.allCases {
                        //let content = cardContentFactory(index)
                        cards.append(Card(id: index, shape: shape, color: color, number: number, shading: shading))
                        index = index + 1
                    }
                }
            }
            
        }
        cards = cards.shuffled()
        chooseCards(count: 12)
    }
    
    mutating func chooseCards(count: Int) {
        var chosenCount = 0
        for var card in cards {
            if !card.isAlreadyShown && chosenCount < count {
                card.isAlreadyShown = true
                currentlyPlayingCards.append(card)
                if let indx = cards.firstIndex(matching: card) {
                    cards[indx].isAlreadyShown = true
                }
                chosenCount = chosenCount + 1
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let choosenIndex = currentlyPlayingCards.firstIndex(matching: card) {
            currentlyPlayingCards[choosenIndex].isSelected = !card.isSelected
            let selectedCards = currentlyPlayingCards.filter{ $0.isSelected }
            if selectedCards.count == 3  {
                if isSet(cards: selectedCards) {
                    isMatch = true
                }
            }
            if selectedCards.count == 4 {
                for crd in selectedCards {
                    if crd.id != card.id {
                        if let idx = currentlyPlayingCards.firstIndex(matching: crd){
                            currentlyPlayingCards[idx].isSelected = false
                        }
                    }
                }
            }
        }
    }
    
    func isSet(cards: [Card]) -> Bool {
        let colors = (cards[0].color == cards[1].color && cards[1].color == cards[2].color) || (cards[0].color != cards[1].color && cards[1].color != cards[2].color && cards[0].color != cards[2].color)
        
        let shading = (cards[0].shading == cards[1].shading && cards[1].shading == cards[2].shading) || (cards[0].shading != cards[1].shading && cards[1].shading != cards[2].shading && cards[0].shading != cards[2].shading)
        
        let quantities = (cards[0].number == cards[1].number && cards[1].number == cards[2].number) || (cards[0].number != cards[1].number && cards[1].number != cards[2].number && cards[0].number != cards[2].number)
        
        let symbols = (cards[0].shape == cards[1].shape && cards[1].shape == cards[2].shape) || (cards[0].shape != cards[1].shape && cards[1].shape != cards[2].shape && cards[0].shape != cards[2].shape)
        
        return colors && shading && quantities && symbols
    }
}
