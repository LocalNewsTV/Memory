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
            
            HStack(alignment: .center) {
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
                .frame(minWidth: 200, maxWidth: 500, minHeight: 25, maxHeight: 100)
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
                }.frame(width: 250)
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
                }.frame(width: 250)
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding(.horizontal, 20)
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
