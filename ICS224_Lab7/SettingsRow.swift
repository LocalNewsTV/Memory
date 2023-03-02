//
//  SettingsRow.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-15.
//

import SwiftUI

struct SettingsRow: View {
    let stepperRangePerGroup = 2...5
    let stepperRangeNumGroups = 1...5
    let stepValue = 1
    @Binding var treasureItem: TreasureItem
    @Binding var changes: Bool
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(alignment: .center, spacing: 20) {
                TextEditor(text:
                            Binding(
                                get: {
                                    treasureItem.imageName
                                },
                                set:{
                                    newValue in
                                    treasureItem.imageName = newValue
                                    changes = true
                                }
                            )
                )
                .frame(width: 250, height: 40)
                Stepper(value: Binding(
                    get: {
                        treasureItem.perGroup
                    },
                    set: {
                        newValue in
                        treasureItem.perGroup = newValue
                        changes = true
                    }),
                        in: stepperRangePerGroup,
                        step: stepValue
                ) {
                    Text("\(treasureItem.perGroup)/per group")
                }.frame(width: 200)
                Stepper(value: Binding(
                    get: {
                        treasureItem.numGroups
                    },
                    set: {
                        newValue in
                        treasureItem.numGroups = newValue
                        changes = true
                    }),
                        in: stepperRangeNumGroups,
                        step: stepValue
                ) {
                    Text("\(treasureItem.numGroups) groups")
                }.frame(width: 200)
            }.frame(maxWidth: .infinity, maxHeight: 75)
        }
    }
}
//
//struct SettingsRow_Previews: PreviewProvider {
//    static var treasureItems = TreasureItems()
//    static var previews: some View {
//        SettingsRow(treasureItem:  treasureItems.entries[0])
//    }
//}
