//
//  SlotViewModel.swift
//  Slots
//
//  Created by Anthony Marasia on 4/28/21.
//

import Foundation

final class SlotViewModel : ObservableObject {
    
    private let images = ["apple", "cherry", "star"]
    
    @Published private(set) var slot1 = "apple"
    @Published private(set) var slot2 = "apple"
    @Published private(set) var slot3 = "apple"
    @Published private(set) var credits = 1000
    @Published var winCount : Int = 0
    
    public func spin() {
        if credits <= 0 {
            return
        }
        doSpin()
        checkScore()
    }
    
    private func getRandomNum() -> Int {
        return Int.random(in: 0...2)
    }
    
    private func doSpin() {
        slot1 = images[getRandomNum()]
        slot2 = images[getRandomNum()]
        slot3 = images[getRandomNum()]
    }
    
    private func checkScore() {
        if slot1 == slot2 && slot1 == slot3 {
            credits += 5
            winCount += 1
        } else {
            credits -= 5
        }
    }
}
