//
//  TreasureItems.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-15.
//

import Foundation
import SwiftUI

class TreasureItemDeck: ObservableObject {
    @Published var entries = [[TreasureItem]]()
    var singleArray = [TreasureItem]()
    
    init() {
        singleArray.append(TreasureItem(imageName: "questionmark", perGroup: 2, numGroups: 2))
        rebuildList(items: singleArray)
    }

    func roundtoSquares(){
        var number = sqrt(Double(entries.count)).rounded(.down) + 1
        number = number * number
        let difference = number - Double(entries.count)
        for _ in 0..<Int(difference){
            singleArray.append(TreasureItem(imageName: "circlebadge", perGroup: Int(difference), numGroups: 1))
        }
        singleArray = singleArray.shuffled()
        
    }
    func rebuildList(items: [TreasureItem]){
        var temp: [TreasureItem] = []
        for i in 0..<items.count {
            for _ in 0..<(items[i].perGroup * items[i].numGroups){
                temp.append(TreasureItem(imageName: items[i].imageName, perGroup: items[i].perGroup, numGroups: items[i].numGroups))
            }
        }
        singleArray = temp
        roundtoSquares()
        
        var square = sqrt(Double(singleArray.count))
        entries = []
        
        for row in 0..<Int(square) {
            var innerArray = [TreasureItem]()
            for col in 0..<Int(square) {
                innerArray.append(singleArray[col+row])
            }
            entries.append(innerArray)
        }
        
    }
}


//////////////////////
class TreasureItems: ObservableObject {
    @Published var entries: [TreasureItem]

    init() {
        entries = [TreasureItem]()
        entries.append(TreasureItem(imageName: "questionmark", perGroup: 2, numGroups: 2))
    }
}
