//
//  TreasureItems.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-15.
//

import Foundation
import SwiftUI

class TreasureItems: ObservableObject {
    @Published var entries: [TreasureItem]
    
    init() {
        entries = [TreasureItem]()
        entries.append(TreasureItem(imageName: "questionmark", perGroup: 2, numGroups: 2))
    }
}
