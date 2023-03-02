//
//  TreasureItem.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-15.
//

import Foundation
import SwiftUI

/// Treasure Item Struct, used for Settings:
/// -id: Unique ID for struct being Identifiable, self appointed
/// -imageName (String): String representation of SystenName for image
/// -perGroup (Int): number of cards that make a complete set
/// -numGroups (Int): Number of sets to create for a game
/// -flipped (Bool): State of card being face up or down, defaulted False
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
