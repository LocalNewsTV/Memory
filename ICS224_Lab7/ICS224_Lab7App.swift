//
//  ICS224_Lab7App.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-08.
//

import SwiftUI

@main
struct ICS224_Lab7App: App {
    @StateObject var treasureItems = TreasureItems()
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(treasureItems)
        }
    }
}
