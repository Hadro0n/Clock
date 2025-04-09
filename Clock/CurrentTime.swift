//
//  CurrentTime.swift
//  Clock
//
//  Created by Владислав Якунин on 09.04.2025.
//

import SwiftUI
import Combine

final class CurrentTime: ObservableObject {
    @Published var seconds = Double.zero
    
    private let timer = Timer.publish(every: 0.16, on: .main, in: .common).autoconnect()
    private var cancellableSet = Set<AnyCancellable>()
    
    init() {
        timer.map { date in
            let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
            let referenceDate = Calendar.current.date(
                from: DateComponents(
                    year: components.year,
                    month: components.month,
                    day: components.day
                )
            )!
            return Date().timeIntervalSince(referenceDate)
        }
        .assign(to: \.seconds, on: self)
        .store(in: &cancellableSet)
    }
}
