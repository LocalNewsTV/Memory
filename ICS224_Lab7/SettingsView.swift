//
//  SettingsView.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-08.
//

import SwiftUI

struct SettingsView: View {
    @Binding var treasureItems: TreasureItems
    var body: some View {
        VStack{
            List($treasureItems.entries){
                $treasureItem in
                SettingsRow(treasureItem: treasureItem)
            }
            Text("Hello From Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    @State static var treasureI
    static var previews: some View {
        SettingsView(treasureItems: treasureItems)
    }
}
