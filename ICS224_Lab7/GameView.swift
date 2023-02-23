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
    @EnvironmentObject var cardList: TreasureItemDeck
    
    var remainingPieces: Int = 0
    var attempts: Int = 0
    var body: some View {
        VStack {
            HStack{
                ForEach($cardList.entries) { $treasureItem in
                    Button(
                        action:
                            {
                                if(treasureItem.flipped != true){
                                    treasureItem.flipped.toggle()
                                    
                                }
                                
                            }
                    )
                    {
                        Image(systemName: treasureItem.flipped ? treasureItem.imageName : "circle.fill")
                    }
                }
            }
        Text("Attempts: \(attempts)")
        Text("Total Remaining \(remainingPieces)")
        }
    }
}

//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}
