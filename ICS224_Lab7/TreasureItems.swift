//
//  TreasureItems.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-15.
//

import Foundation
import SwiftUI

class TreasureItemDeck: ObservableObject {
    @Published var entries = [TreasureItem]()
    init() {
        entries.append(TreasureItem(imageName: "questionmark", perGroup: 2, numGroups: 2))
    }
    init(items: [TreasureItem]){
        var temp: [TreasureItem] = []
        for i in 0..<items.count {
            for _ in 0..<(items[i].perGroup * items[i].numGroups){
                temp.append(TreasureItem(imageName: items[i].imageName, perGroup: items[i].perGroup, numGroups: items[i].numGroups))
            }
        }
        entries = temp
    }
    
}

class TreasureItems: ObservableObject {
    @Published var entries: [TreasureItem]
    
    init() {
        entries = [TreasureItem]()
        entries.append(TreasureItem(imageName: "questionmark", perGroup: 2, numGroups: 2))
    }
}
