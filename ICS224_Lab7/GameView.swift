//
//  GameView.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-15.
//

import SwiftUI

/// Gameview, takes the TreasureItemDecks entries with the grid to generate a evenly spread grid of Icons for the memory game
/// Uses:
///     -treasureCards: the instantiation of the TreasureItemDeck class, contains all game logic and holds all cards
///     -treasureItems: The array of TreasureItems used in Game Settings, only used if a new game is called from this view
struct GameView: View {
    @EnvironmentObject var treasureItems: TreasureItems
    @EnvironmentObject var treasureCards: TreasureItemDeck
    
    var body: some View {
        VStack {
            Grid{
                let size: Int = treasureCards.entries.count
                ForEach(0..<size, id: \.self) { row in
                    GridRow {
                        ForEach(0..<size, id: \.self){ col in
                            Button(
                                action:
                                    {
                                        if(treasureCards.entries[row][col].flipped != true){
                                            treasureCards.entries[row][col].flipped.toggle()
                                            treasureCards.Pick(item: treasureCards.entries[row][col])
                                        }
                                    }
                            )
                            {
                                Image(systemName: treasureCards.entries[row][col].flipped ? (treasureCards.entries[row][col].imageName ) : "circle.fill")
                                    .foregroundColor(.black)
                            }.frame(width: 20, height: 20)
                        }
                    }
                }
            }
            Text("Attempts: \(treasureCards.attempts)")
            Text("Total Remaining \(treasureCards.remaining)")
            if(treasureCards.remaining == 0){
                Text("Game Over!")
                Button(
                    action: {
                        treasureCards.newGame(items: treasureItems.entries)
                    },
                    label: {
                        Text("New Game")
                    }
                )
            }
        }
        .navigationBarTitle(Text(""))
    }
}
//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}
