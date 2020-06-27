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
    @State var matchCount = 0
    var body: some View {
        return NavigationView {
            VStack {
                Grid(gameLogic.cards) { card in
                    CardView(card: card).onTapGesture {
                        self.gameLogic.choose(card: card)
                    }
                .padding(4)
                }
            }
            .alert(isPresented: $gameLogic.hasMatch) {
                Alert(title: Text("Match"), message: Text("Got a match"), dismissButton: .default(Text("Ok"), action: {
                    self.matchCount = self.matchCount + 1
                    self.gameLogic.chooseThreeMoreCards()
                }))
            }
            .foregroundColor(.orange)
            .navigationBarTitle(matchCount == 0 ? "SET" : "SET, Matches:\(matchCount)")
            .navigationBarItems(leading: Button("New Game"){
                    self.gameLogic.restartGame()
                    self.matchCount = 0
                }, trailing: Button("Deal 3 more"){
                    self.gameLogic.chooseThreeMoreCards()
            })
        }
    }
}

struct CardView: View {
    var card: SetCardgame.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
                //.scaleEffect(self.card.isSelected ? 1.1 : 1)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isSelected {
                RoundedRectangle(cornerRadius: 10).fill(Color.orange)
            } else {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
            }
            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1)
            if card.shape == .oval {
                OvalView(count: card.number, color: card.color, shading: card.shading)
            } else if card.shape == .diamond {
                DiamondView(count: card.number, color: card.color, shading: card.shading)
            } else if card.shape == .squiggles {
                TriangleView(count: card.number, color: card.color, shading: card.shading)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(gameLogic: SetViewModel())
    }
}
