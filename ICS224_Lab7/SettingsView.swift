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
//    @State var changes = false
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
