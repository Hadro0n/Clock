//
//  ContentView.swift
//  Clock
//
//  Created by Владислав Якунин on 09.04.2025.
//

import SwiftUI

struct ClockView: View {
    @ObservedObject var currentTime = CurrentTime()
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 8)
            
            ForEach(0..<60) {tick in
                VStack {
                    Rectangle()
                        .fill(.primary)
                        .opacity(1)
                        .frame(width: 2, height: tick % 5 == 0 ? 15 : 7)
                    Spacer()
                }
                .rotationEffect(.degrees(Double(tick)/60 * 360))
            }
            
            ForEach(1..<13) { tick in
                VStack {
                    Text("\(tick)")
                        .font(.title)
                        .rotationEffect(.degrees(-Double(tick)/12 * 360))
                    Spacer()
                }
                .rotationEffect(.degrees(Double(tick)/12 * 360))
            }
            .padding()
            
            // Секундная стрелка
            Hand(angleMultiplier: currentTime.seconds.remainder(dividingBy: 60) / 60, scale: 0.7)
                .stroke(.red, lineWidth: 1)
            // Минутная стрелка
            Hand(angleMultiplier: currentTime.seconds/60 / 60, scale: 0.6)
                .stroke(lineWidth: 2)
            //Часовая стрелка
            Hand(angleMultiplier: currentTime.seconds / (60*12) / 60, scale: 0.5)
                .stroke(lineWidth: 4)
            
            ZStack {
                Circle()
                    .fill(.primary)
                    .frame(width: 8, height: 8)
                
                Circle()
                    .fill(.background)
                    .frame(width: 4, height: 4)
            }
            
        }
        .frame(width: 300, height: 300)
    }
    
}

#Preview {
    ClockView()
}
