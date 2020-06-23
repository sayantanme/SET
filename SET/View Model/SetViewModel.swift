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
    
    static func createSetGame() -> SetCardgame<String> {
        return SetCardgame<String>() { (index) -> String in
            return "😀"
        }
    }
    
    var cards: [SetCardgame<String>.Card] {
        return Array(model.cards.prefix(12))
    }
}
