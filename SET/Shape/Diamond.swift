//
//  Diamond.swift
//  SET
//
//  Created by Sayantan Chakraborty on 24/06/20.
//  Copyright © 2020 Sayantan Chakraborty. All rights reserved.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
    
}

struct Diamond_Previews: PreviewProvider {
    static var previews: some View {
        Diamond()
            .stroke(lineWidth: 2)
    }
}
