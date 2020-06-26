//
//  TriangleShape.swift
//  SET
//
//  Created by Sayantan Chakraborty on 25/06/20.
//  Copyright © 2020 Sayantan Chakraborty. All rights reserved.
//

import SwiftUI

struct TriangleView: View {
    let count: CardNumber
    let color: CardColor
    let shading: CardShading
    var body: some View {
        HStack {
            ForEach(0..<count.rawValue) { val in
                if self.shading == .solid {
                    Triangle().foregroundColor(self.getCorrespondingColor(self.color))
                        .frame(width: 20, height: 60, alignment: .center)
                } else if self.shading == .outlined {
                    Triangle()
                        .stroke(lineWidth: 2)
                        .foregroundColor(self.getCorrespondingColor(self.color))
                        .frame(width: 20, height: 60, alignment: .center)
                } else {
                    if self.color == .red {
                        Triangle()
                            .stroke(lineWidth: 2)
                            .foregroundColor(self.getCorrespondingColor(self.color))
                            .background(Image("redStripe").resizable()
                                            .clipShape(Triangle()))
                            .frame(width: 20, height: 60, alignment: .center)
                    } else if self.color == .green {
                        Triangle()
                            .stroke(lineWidth: 2)
                            .foregroundColor(self.getCorrespondingColor(self.color))
                            .background(Image("greenStripe").resizable()
                                .clipShape(Triangle()))
                                //.frame(width: 10, height: 40, alignment: .center))
                            .frame(width: 20, height: 60, alignment: .center)
                    } else{
                        Triangle()
                            .stroke(lineWidth: 2)
                            .foregroundColor(self.getCorrespondingColor(self.color))
                            .background(Image("purpleStripe")
                                            .resizable()
                                            .clipShape(Triangle()))
                                //.frame(width: 10, height: 40, alignment: .center))
                            .frame(width: 20, height: 60, alignment: .center)
                    }
                }
            }
        }
    }
}

struct TriangleShape_Previews: PreviewProvider {
    static var previews: some View {
        TriangleView(count: CardNumber.three, color: .red, shading: .striped)
    }
}
