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
    init (imageName: String, perGroup: Int, numGroups: Int) {
        self.imageName = imageName
        self.perGroup = perGroup
        self.numGroups = numGroups
    }
}
