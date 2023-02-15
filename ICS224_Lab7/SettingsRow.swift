//
//  SettingsRow.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-15.
//

import SwiftUI

struct SettingsRow: View {
    @State var treasureItem: TreasureItem
    var body: some View {
        HStack {
            TextEditor(text:
                Binding(
                    get: {
                        treasureItem.imageName
                    },
                    set:{
                        newValue in
                        treasureItem.imageName = newValue
                    }
                )
            )
        }
    }
}

struct SettingsRow_Previews: PreviewProvider {
    static var treasureItems = TreasureItems()
    static var previews: some View {
        SettingsRow(treasureItem:  treasureItems.entries[0])
    }
}
