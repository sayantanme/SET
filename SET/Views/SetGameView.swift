//
//  SetGameView.swift
//  SET
//
//  Created by Sayantan Chakraborty on 21/06/20.
//  Copyright © 2020 Sayantan Chakraborty. All rights reserved.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var gameLogic: SetViewModel
    var body: some View {
        VStack {
            Grid(gameLogic.cards) { card in
                CardView(card: card)
                .padding(5)
            }
        }
        .padding()
        .foregroundColor(.orange)
        
    }
}

struct CardView: View {
    var card: SetCardgame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).fill(Color.white)
            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
            if card.shape == .oval {
                OvalView(count: card.number, color: card.color, shading: card.shading)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(gameLogic: SetViewModel())
    }
}
