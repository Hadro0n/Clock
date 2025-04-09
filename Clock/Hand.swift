//
//  Hand.swift
//  Clock
//
//  Created by Владислав Якунин on 09.04.2025.
//

import SwiftUI

struct Hand: Shape {
    let angleMultiplier: CGFloat
    let scale: CGFloat
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let length = rect.width / 2
            let center = CGPoint(x: rect.midX, y: rect.midY)
            
            path.move(to: center)
            
            let angle = CGFloat.pi/2 - CGFloat.pi * 2 * angleMultiplier
            
            path.addLine(
                to: CGPoint(
                    x: rect.midX + cos(angle) * length * scale,
                    y: rect.midY - sin(angle) * length * scale
                )
            )
        }
    }
}

#Preview {
    ZStack {
        // Секундная стрелка
        Hand(angleMultiplier: 20/60, scale: 0.8)
            .stroke(.red, lineWidth: 1)
        // Минутная стрелка
        Hand(angleMultiplier: 30/60, scale: 0.7)
            .stroke(lineWidth: 2)
        //Часовая стрелка
        Hand(angleMultiplier: 15/60, scale: 0.5)
            .stroke(lineWidth: 4)
    }
}
