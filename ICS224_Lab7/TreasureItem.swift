//
//  TreasureItem.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-15.
//

import Foundation
import SwiftUI

struct TreasureItem: Identifiable {
    let id = UUID()
    var imageName: String
    var perGroup: Int
    var numGroups: Int
    var flipped: Bool
    init (imageName: String, perGroup: Int, numGroups: Int, flipped: Bool = false) {
        self.imageName = imageName
        self.perGroup = perGroup
        self.numGroups = numGroups
        self.flipped = flipped
    }
}
