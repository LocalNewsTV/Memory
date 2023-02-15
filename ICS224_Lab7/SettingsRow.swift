//
//  SettingsRow.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-15.
//

import SwiftUI

struct SettingsRow: View {
    let stepperRange = 2...5
    let stepValue = 1
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
                }),
                     in: stepperRange,
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
                }),
                     in: stepperRange,
                    step: stepValue
            ) {
                Text("\(treasureItem.numGroups) groups")
            }.frame(height: 150, alignment: .leading)
        }
        
    }
    
    
    
}

struct SettingsRow_Previews: PreviewProvider {
    static var treasureItems = TreasureItems()
    static var previews: some View {
        SettingsRow(treasureItem:  treasureItems.entries[0])
    }
}
