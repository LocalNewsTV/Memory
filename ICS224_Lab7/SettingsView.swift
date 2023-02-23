//
//  SettingsView.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-08.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var treasureItems: TreasureItems
    @ObservedObject var treasureCards: TreasureItemDeck
    @State var changes = false
    var body: some View {
    VStack {
            List($treasureItems.entries){
                $treasureItem in
                SettingsRow(treasureItem: $treasureItem, changes: $changes)
            }
            .onChange(of: changes, perform: { newValue in
                treasureCards.rebuildList(items: treasureItems.entries)
                changes = false
            })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    @ObservedObject static var treasureItems = TreasureItems()
    @ObservedObject static var treasureCards = TreasureItemDeck()
    
    static var previews: some View {
        SettingsView(treasureItems: treasureItems, treasureCards: treasureCards)
    }
}
