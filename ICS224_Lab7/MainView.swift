//
//  MainView.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-15.
//

import SwiftUI



struct MainView: View {
    @State var view = "Start"
    @EnvironmentObject var treasureItems: TreasureItems
    var body: some View {
        NavigationStack() {
            VStack(){
                if view == "Start" {
                    StartView()
                }
                else if view == "Settings" {
                    
                    SettingsView().environmentObject(treasureItems)
                        
                }
                else if view == "Game" {
                    GameView().environmentObject(treasureItems)
                }
            }
            .navigationBarTitle(Text("Game"))
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    if view == "Settings" {
                        Button(
                            action: {
                                withAnimation {
                                    let item = TreasureItem(imageName: "questionmark", perGroup: 2, numGroups: 2)
                                    treasureItems.entries.insert(item, at: 0)
                                }
                            }
                        ){
                            Image(systemName: "plus")
                        }
                    }
                }
                ToolbarItem(placement: .bottomBar){Spacer()}
                ToolbarItem(placement: .bottomBar){
                    Button(
                        action: { view = "Start"}
                    ){
                        Text("Start")
                            .foregroundColor(view == "Start" ? .blue : .black)
                    }
                    .accessibilityIdentifier("StartNavButton")
                }
                ToolbarItem(placement: .bottomBar){Spacer()}
                ToolbarItem(placement: .bottomBar){
                    Button(
                        action: {view = "Game" }
                    ){
                        Text("Game")
                            .foregroundColor(view == "Game" ? .blue : .black)
                    }
                    .accessibilityIdentifier("GameNavButton")
                }
                ToolbarItem(placement: .bottomBar){Spacer()}
                ToolbarItem(placement: .bottomBar){
                    Button(
                        action: { view = "Settings" } )
                    {
                        Text("Settings")
                            .foregroundColor(view == "Settings" ? .blue : .black)
                    }
                    .accessibilityIdentifier("SettingsBarButton")

                }
                ToolbarItem(placement: .bottomBar){Spacer()}
            }
        }
    }
}
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
