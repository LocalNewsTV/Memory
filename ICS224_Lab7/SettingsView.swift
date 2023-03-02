//
//  SettingsView.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-08.
//

import SwiftUI

/// Settings View, View for player to update the treasure Items for the next game. creates SettingsRows for all items in the treasureItems array where users can modify values
/// uses Observed Objects
///     -treasureItems: Instance of Settings that player can directly affect to change tokens in game
///     -treasureCards: passed in to call newGame functionality on change of the game settings
///   Binding Variables:
///   -changes Bool : inefficient method for detecting changes to settings array so new games will instantiate
struct SettingsView: View {
    @ObservedObject var treasureItems: TreasureItems
    @ObservedObject var treasureCards: TreasureItemDeck
    @Binding var changes: Bool
    var body: some View {
        VStack {
            List($treasureItems.entries){
                $treasureItem in
                SettingsRow(treasureItem: $treasureItem, changes: $changes)
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            treasureItems.entries.removeAll(where: { $0.id == treasureItem.id})
                            changes = true
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
            }
            .onChange(of: changes, perform: { newValue in
                treasureCards.newGame(items: treasureItems.entries)
                changes = false
            })
        }
        .navigationBarTitle(Text("Treasures"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    @ObservedObject static var treasureItems = TreasureItems()
    @ObservedObject static var treasureCards = TreasureItemDeck()
    @State static var changes = false
    
    static var previews: some View {
        SettingsView(treasureItems: treasureItems, treasureCards: treasureCards, changes: $changes)
    }
}
