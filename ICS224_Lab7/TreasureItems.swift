//
//  TreasureItems.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-15.
//

import Foundation
import SwiftUI

class TreasureItemDeck: ObservableObject {
    @Published var entries: [[TreasureItem]] = []
    @Published var remaining: Int = 0
    var singleArray: [TreasureItem] = []
    init() {
        rebuildList(items: [TreasureItem(imageName: "questionmark", perGroup: 2, numGroups: 2)])
    }

    
    func roundToSquare(items: [TreasureItem])-> [TreasureItem] {
        var newArray = items
        var initSquare = Int(sqrt(Double(items.count)).rounded(.down)) + 1
        initSquare = initSquare * initSquare

        while newArray.count != initSquare {
            print("\(initSquare) count: \(items.count)")
            newArray.append(TreasureItem(imageName: "circlebadge", perGroup: 1, numGroups: 1))
        }
        return newArray
    }
    
    func rebuildList(items: [TreasureItem]){
        var temp: [TreasureItem] = []
        for i in 0..<items.count {
            for _ in 0..<(items[i].perGroup * items[i].numGroups){
                temp.append(TreasureItem(imageName: items[i].imageName, perGroup: items[i].perGroup, numGroups: items[i].numGroups))
            }
        }
        temp = roundToSquare(items: temp)
        print("Printing after RoundToSquare \(temp.count)")
        
        
        singleArray = temp
        entries = []
        let gridSize: Int = Int(sqrt(Double(singleArray.count)))
        var num = 0
        print(gridSize)
        for _ in 0..<gridSize{
            var innerArray: [TreasureItem] = []
            for _ in 0..<gridSize {
                print(singleArray[num].imageName)
                innerArray.append(singleArray[num])
                num += 1
            }
            entries.append(innerArray)
        }
        print("Total Count: \(entries.count)")
        
    }
}


class TreasureItems: ObservableObject {
    @Published var entries: [TreasureItem]

    init() {
        entries = [TreasureItem]()
        entries.append(TreasureItem(imageName: "questionmark", perGroup: 2, numGroups: 2))
    }
}
