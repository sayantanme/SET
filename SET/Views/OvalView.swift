//
//  OvalView.swift
//  SET
//
//  Created by Sayantan Chakraborty on 23/06/20.
//  Copyright © 2020 Sayantan Chakraborty. All rights reserved.
//

import SwiftUI

struct OvalView: View {
    let count: CardNumber
    let color: CardColor
    let shading: CardShading
    var body: some View {
        HStack {
            ForEach(0..<count.rawValue) { val in
                if self.shading == .solid {
                    Capsule()
                        .foregroundColor(self.getCorrespondingColor(self.color))
                        .frame(width: 20, height: 80, alignment: .center)
                } else if self.shading == .outlined {
                    Capsule()
                        .stroke(lineWidth: 2)
                        .foregroundColor(self.getCorrespondingColor(self.color))
                        .frame(width: 20, height: 80, alignment: .center)
                } else {
                    if self.color == .red {
                        Capsule()
                            .stroke(lineWidth: 2)
                            .foregroundColor(self.getCorrespondingColor(self.color))
                            .background(Image("redStripe").resizable()
                                .clipped()
                                .frame(width: 20, height: 60, alignment: .center))
                            .frame(width: 20, height: 80, alignment: .center)
                    } else if self.color == .green {
                        Capsule()
                            .stroke(lineWidth: 2)
                            .foregroundColor(self.getCorrespondingColor(self.color))
                            .background(Image("greenStripe").resizable()
                                .clipped()
                                .frame(width: 20, height: 60, alignment: .center))
                            .frame(width: 20, height: 80, alignment: .center)
                    } else {
                        Capsule()
                            .stroke(lineWidth: 2)
                            .foregroundColor(self.getCorrespondingColor(self.color))
                            .background(Image("purpleStripe").resizable()
                                .clipped()
                                .frame(width: 20, height: 60, alignment: .center))
                            .frame(width: 20, height: 80, alignment: .center)
                    }
                
                }
            }
        }
        .padding(20)
        
    }
    
    
}

extension View {
    func getCorrespondingColor(_ color: CardColor) -> Color {
        switch color {
        case .red:
            return Color.red
            
        case .green:
            return Color.green
            
        case .purple:
            return Color.purple
            
        }
    }
}


struct OvalView_Previews: PreviewProvider {
    static var previews: some View {
        OvalView(count: CardNumber.three, color: .purple, shading: .striped)
    }
}
