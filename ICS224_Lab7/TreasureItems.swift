//
//  TreasureItems.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-15.
//

import Foundation
import SwiftUI
///
class TreasureItemDeck: ObservableObject {
    @Published var entries: [[TreasureItem]] = []
    @Published var remaining: Isnt = 0
    @Published var attempts: Int = 0
    var currentGuesses: [TreasureItem] = []
    var singleArray: [TreasureItem] = []
    
    init() {
        newGame(items: [TreasureItem(imageName: "questionmark", perGroup: 2, numGroups: 2)])
    }

    //
    func roundToSquare(items: [TreasureItem])-> [TreasureItem] {
        var newArray = items
        var initSquare = Int(sqrt(Double(items.count)).rounded(.down)) + 1
        initSquare = initSquare * initSquare

        while newArray.count != initSquare {
            newArray.append(TreasureItem(imageName: "circlebadge", perGroup: 1, numGroups: 1))
        }
        return newArray.shuffled()
    }
    /// Creates a new instance of a game
    ///  - Parameter items:
    func newGame(items: [TreasureItem]){
        remaining = 0
        attempts = 0
        var temp: [TreasureItem] = []
        for i in 0..<items.count {
            for _ in 0..<(items[i].perGroup * items[i].numGroups){
                remaining += 1
                temp.append(TreasureItem(imageName: items[i].imageName, perGroup: items[i].perGroup, numGroups: items[i].numGroups))
            }
        }
        temp = roundToSquare(items: temp)
        
        singleArray = temp
        entries = []
        let gridSize: Int = Int(sqrt(Double(singleArray.count)))
        var num = 0
        for _ in 0..<gridSize{
            var innerArray: [TreasureItem] = []
            for _ in 0..<gridSize {
                innerArray.append(singleArray[num])
                num += 1
            }
            entries.append(innerArray)
        }
    }
    
    func flipBack(){
        for item in currentGuesses {
            var matched = false
            for row in 0..<entries.count {
                for col in 0..<entries[row].count{
                    if entries[row][col].id == item.id{
                        entries[row][col].flipped = false
                        matched = true
                        break
                    }
                    if matched {break}
                }
            }
        }
    }
    func Pick(item: TreasureItem){
        if item.imageName != "circlebadge" {
            attempts += 1
            currentGuesses.append(item)
            if(currentGuesses[0].imageName == item.imageName){
                if(currentGuesses.count == item.perGroup){
                    remaining -= currentGuesses.count
                    currentGuesses = []
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    self.flipBack()
                    self.currentGuesses = []
                }
                
            }
        }
    }
}


class TreasureItems: ObservableObject {
    @Published var entries: [TreasureItem]

    init() {
        entries = [TreasureItem]()
        entries.append(TreasureItem(imageName: "questionmark", perGroup: 2, numGroups: 2))
    }
}
