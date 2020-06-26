//
//  SetViewModel.swift
//  SET
//
//  Created by Sayantan Chakraborty on 21/06/20.
//  Copyright © 2020 Sayantan Chakraborty. All rights reserved.
//

import Foundation
class SetViewModel: ObservableObject {
    @Published private var model = createSetGame()
    
    static func createSetGame() -> SetCardgame {
        return SetCardgame() { _ in
            
        }
    }
    
    var cards: [SetCardgame.Card] {
        return model.currentlyPlayingCards
    }

    // MARK: Intent
    func chooseThreeMoreCards() {
        model.chooseCards(count: 3)
    }
}
