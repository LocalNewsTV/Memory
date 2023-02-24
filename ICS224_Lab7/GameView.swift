//
//  GameView.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-15.
//

import SwiftUI

struct GameView: View {
//    @State var cardList: [gamePiece]
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
            Text(treasureCards.remaining == 0 ? "You win!" : "")
        }
        .navigationBarTitle(Text(""))
    }
}

//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}
