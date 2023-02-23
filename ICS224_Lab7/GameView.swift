//
//  GameView.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-15.
//

import SwiftUI

class gamePiece: Identifiable {
    let id = UUID()
    let image: String
    var flipped: Bool
    init(image: String, flipped: Bool = false){
        self.image = image
        self.flipped = flipped
    }
    func flip()->Void{
        self.flipped = self.flipped ? false : true
        print(self.flipped)
    }
}

func generateGameArray(items: TreasureItems) -> [gamePiece]{
    var set: [gamePiece] = []
    for i in 0..<items.entries.count {
        for _ in 0..<(items.entries[i].numGroups * items.entries[i].perGroup) {
            set.append(gamePiece(image: items.entries[i].imageName))
        }
    }
    print(set)
    return set.shuffled()
}

struct GameView: View {
    @EnvironmentObject var treasureItems: TreasureItems
    @State var arr = []
    var body: some View {
        HStack{
            ForEach(generateGameArray(items: treasureItems)) { treasureItem in
                    Button(
                        action: { treasureItem.flip() } )
                    {
                        Image(systemName: treasureItem.flipped ? treasureItem.image : "circle.fill")
                    }
                
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
