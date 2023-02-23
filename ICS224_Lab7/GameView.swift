//
//  GameView.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-15.
//

import SwiftUI

struct GameView: View {
    @State var cardList: [gamePiece]
    @State var currGuess: [gamePiece]
    var remainingPieces: Int = 0
    var attempts: Int = 0
    var body: some View {
        VStack {
            HStack{
                //            ForEach($treasureItems.entries){
                //                $treasureItem in
                //                Button (
                //                    action: {
                //                        treasureItem.flipped.toggle()
                //                    }){
                //                        Image(systemName: treasureItem.flipped ? treasureItem.imageName : "circle.fill")
                //                    }
                ForEach($cardList) { $treasureItem in
                    Button(
                        action:
                            {
                                if(treasureItem.flipped != true){
                                    treasureItem.flipped.toggle()
                                    if currGuess.count == 0 {
                                        currGuess.append(treasureItem)
                                        return
                                    }
                                    
                                    else if currGuess[0].image == treasureItem.image {
                                        currGuess.append(treasureItem)
                                        if currGuess.count == treasureItem.numPerGroup {
                                            print("Successful Matching")
                                            currGuess = []
                                            //removal Logic
                                        }
                                    }
                                    else {
                                        print("Wrong!")
                                        for i in 0..<currGuess.count {
                                            currGuess[i].flipped.toggle()
                                        }
                                        currGuess = []
                                    }
                                }
                            }
                    )
                    {
                        Image(systemName: treasureItem.flipped ? treasureItem.image : "circle.fill")
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
