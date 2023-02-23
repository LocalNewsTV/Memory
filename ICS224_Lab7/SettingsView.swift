//
//  SettingsView.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-08.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var treasureItems: TreasureItems
    var body: some View {
        VStack{
            List($treasureItems.entries){
                $treasureItem in
                SettingsRow(treasureItem: $treasureItem)
            }

        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    @EnvironmentObject static var treasureItems: TreasureItems
    //@State static var treasureItems = TreasureItems()
    
    static var previews: some View {
        SettingsView().environmentObject(treasureItems)
    }
}
