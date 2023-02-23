//
//  MainView.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-15.
//

import SwiftUI


struct gamePiece: Identifiable {
    let id = UUID()
    let image: String
    var flipped: Bool
    var numPerGroup: Int
    init(image: String, flipped: Bool = false, numPerGroup: Int){
        self.image = image
        self.flipped = flipped
        self.numPerGroup = numPerGroup
    }
}
class Deck: ObservableObject {
    @Published var tiles = [gamePiece]()
    init(){
    }
}
func generateGameArray(items: TreasureItems) -> [gamePiece]{
    var set: [gamePiece] = []
    for i in 0..<items.entries.count {
        for _ in 0..<(items.entries[i].numGroups * items.entries[i].perGroup) {
            set.append(gamePiece(image: items.entries[i].imageName, numPerGroup: items.entries[i].perGroup))
        }
    }
    print(set)
    return set.shuffled()
}


struct MainView: View {
    @State var view = "Start"
    @StateObject var treasureItems = TreasureItems()
    @StateObject var treasureCards = TreasureItemDeck()
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
                    GameView().environmentObject(treasureCards).environmentObject(treasureItems)
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
