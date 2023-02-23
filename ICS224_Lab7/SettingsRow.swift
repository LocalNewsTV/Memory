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
        HStack {
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
            .frame(width:100, height: 35)
            .lineLimit(1)
            
            //End of TextEditor
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
            }
            .padding()
            .frame(height: 150, alignment: .leading)
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
            }.frame(height: 150, alignment: .leading)
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
