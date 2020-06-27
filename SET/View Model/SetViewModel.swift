//
//  SetViewModel.swift
//  SET
//
//  Created by Sayantan Chakraborty on 21/06/20.
//  Copyright © 2020 Sayantan Chakraborty. All rights reserved.
//

import Foundation
class SetViewModel: ObservableObject {
    @Published private var model: SetCardgame
    
    
    init() {
        model = SetCardgame()
    }
    
    var cards: [SetCardgame.Card] {
        return model.currentlyPlayingCards
    }

    // MARK: Intent
    func chooseThreeMoreCards() {
        model.chooseCards(count: 3)
    }
    
    func choose(card: SetCardgame.Card) {
        model.choose(card: card)
    }
    
    var hasMatch: Bool {
        get {
            model.isMatch
        } set {
            model.isMatch = false
        }
    }
    
    func restartGame() {
        model = SetCardgame()
    }
}
