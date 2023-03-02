//
//  MainView.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-15.
//

import SwiftUI

///Overarching view of the application, has a navigation for player to mitigate through the menus uses the following:
/// -view (String): representing which view to display for if-else logic
/// -changes (Bool): used for detecting when settings are changed so new games are made with new logic
/// -treasureItems: holds the players game settings
/// -treasureCards: Game instantiation with all pieces
struct MainView: View {
    @State var view = "Start"
    @State var changes: Bool = false
    @StateObject var treasureItems = TreasureItems()
    @StateObject var treasureCards = TreasureItemDeck()
    var body: some View {
        NavigationStack() {
            VStack(){
                if view == "Start" {
                    StartView()
                }
                else if view == "Settings" {
                    SettingsView(treasureItems: treasureItems, treasureCards: treasureCards, changes: $changes ).environmentObject(treasureItems)
                }
                else if view == "Game" {
                    GameView().environmentObject(treasureCards).environmentObject(treasureItems)
                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    if view == "Settings" {
                        Button(
                            action: {
                                withAnimation {
                                    let item = TreasureItem(imageName: "questionmark", perGroup: 2, numGroups: 2)
                                    treasureItems.entries.insert(item, at: 0)
                                    changes = true
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
