//
//  DiamondView.swift
//  SET
//
//  Created by Sayantan Chakraborty on 24/06/20.
//  Copyright © 2020 Sayantan Chakraborty. All rights reserved.
//

import SwiftUI

struct DiamondView: View {
    let count: CardNumber
    let color: CardColor
    let shading: CardShading
    var body: some View {
        HStack {
            ForEach(0..<count.rawValue) { val in
                if self.shading == .solid {
                    Diamond().foregroundColor(self.getCorrespondingColor(self.color))
                        .frame(width: 20, height: 60, alignment: .center)
                } else if self.shading == .outlined {
                    Diamond()
                        .stroke(lineWidth: 2)
                        .foregroundColor(self.getCorrespondingColor(self.color))
                        .frame(width: 20, height: 60, alignment: .center)
                } else {
                    if self.color == .red {
                        Diamond()
                            .stroke(lineWidth: 2)
                            .foregroundColor(self.getCorrespondingColor(self.color))
                            .background(Image("redStripe").resizable()
                                            .clipShape(Diamond()))
                            .frame(width: 20, height: 60, alignment: .center)
                    } else if self.color == .green {
                        Diamond()
                            .stroke(lineWidth: 2)
                            .foregroundColor(self.getCorrespondingColor(self.color))
                            .background(Image("greenStripe").resizable()
                                .clipShape(Diamond()))
                                //.frame(width: 10, height: 40, alignment: .center))
                            .frame(width: 20, height: 60, alignment: .center)
                    } else{
                        Diamond()
                            .stroke(lineWidth: 2)
                            .foregroundColor(self.getCorrespondingColor(self.color))
                            .background(Image("purpleStripe")
                                            .resizable()
                                            .clipShape(Diamond()))
                                //.frame(width: 10, height: 40, alignment: .center))
                            .frame(width: 20, height: 60, alignment: .center)
                    }
                }
            }
        }
    }
}

struct DiamondView_Previews: PreviewProvider {
    static var previews: some View {
        DiamondView(count: CardNumber.three, color: .red, shading: .striped)
    }
}
