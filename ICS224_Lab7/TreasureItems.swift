//
//  TreasureItems.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-15.
//

import Foundation
import SwiftUI
/// Deck of Playable cards for game, holds all Treasures and functionality for game.
///  Class also maintains variables for how many tiles are remaining, as well as attempts taken in the current session
///  Variables:
///  -Entries: 2D Array of TreasureItem (Cards) for the game
///  -remaninig (Int) - Number of cards left in the game
///  -attempts (Int) - Number of presses a user has made in the current game, lower is better
///  -currentGuesses: Treasure Item array of currently selected cards. used for comparisons, flipping and counting
///  -singleArray: single array of cards, before being converted to a 2D array for the grid
class TreasureItemDeck: ObservableObject {
    @Published var entries: [[TreasureItem]] = []
    @Published var remaining: Int = 0
    @Published var attempts: Int = 0
    @Published var moveInProgress: Bool = false
    var currentGuesses: [TreasureItem] = []
    var singleArray: [TreasureItem] = []
    
    //Default constructor Calls newGame with a TreasureItem array representing the settings
    init() {
        newGame(items: [TreasureItem(imageName: "questionmark", perGroup: 2, numGroups: 2)])
    }
    
    /// Takes and array and pads it until size equals next perfect square
    /// - Parameter items: Array of [TreasureItems] representing the settings of the game
    /// - Returns: [TreasureItems] array with a count(size) equal to a perfect square
    func roundToSquare(items: [TreasureItem])-> [TreasureItem] {
        var newArray = items
        var initSquare = Int(sqrt(Double(items.count)).rounded(.down)) + 1
        initSquare = initSquare * initSquare
        
        while newArray.count != initSquare {
            newArray.append(TreasureItem(imageName: "circlebadge", perGroup: 1, numGroups: 1))
        }
        return newArray.shuffled()
    }
    /// Creates a new instance of a game, does the following:
    ///     -Sets 'remaining' and 'attempts' back to 0
    ///     -iterates through an array of treasure items (The values from settings)
    ///     -creates an array of TreasureItems equal to the value of settings
    ///     -pads the array to the nearest perfect square
    ///     -converts the array into a 2D Array of cards
    ///  - Parameter items: a [TreasureItem] array to build off of
    func newGame(items: [TreasureItem]){
        remaining = 0
        attempts = 0
        moveInProgress = false
        var temp: [TreasureItem] = []
        for i in 0..<items.count {
            for _ in 0..<(items[i].perGroup * items[i].numGroups){
                remaining += 1
                temp.append(TreasureItem(imageName: items[i].imageName, perGroup: items[i].perGroup, numGroups: items[i].numGroups))
            }
        }
        temp = roundToSquare(items: temp)
        
        //Creating 2D Array from the single array
        singleArray = temp
        entries = []
        let gridSize: Int = Int(sqrt(Double(singleArray.count)))
        var num = 0
        for _ in 0..<gridSize{
            var innerArray: [TreasureItem] = []
            for _ in 0..<gridSize {
                innerArray.append(singleArray[num])
                num += 1
            }
            entries.append(innerArray)
        }
    }
    ///Takes all items in the currentGuesses array and resets their flipped status back to false in the entries array. (Turning them over in GameView)
    func flipBack(){
        for item in currentGuesses {
            var matched = false
            for row in 0..<entries.count {
                for col in 0..<entries[row].count{
                    if entries[row][col].id == item.id{
                        entries[row][col].flipped = false
                        matched = true
                        break
                    }
                    if matched {break}
                }
            }
        }
    }
    ///Main controller for the "Cards" in the game view, does the flow control for the game progression
    /// - Increases attempts everytime a non-blank card is selected
    /// - appends selected card to currentGuesses array and compares entries
    /// - if non-matching card is selected, flipBack() is called and the currentGuesses is reset
    /// - if a set of matching cards fills the array, the array is reset and 'remaining' is reduced accordingly
    ///  **Move in Progress is added 3 times in function to account for the asyncAfter calls delay**
    func Pick(item: TreasureItem){
        attempts += 1
        if item.imageName != "circlebadge" {
            currentGuesses.append(item)
        }
        if(currentGuesses.count > 0 && currentGuesses[0].imageName == item.imageName){
            if(currentGuesses.count == item.perGroup){
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                    self.remaining -= self.currentGuesses.count
                    self.completed()
                    self.currentGuesses = []
                    self.moveInProgress = false
                }
            }
            else {
                moveInProgress = false
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.flipBack()
                self.currentGuesses = []
                self.moveInProgress = false
            }
        }
    }
    /// Iterates through all items in the currentGuesses array and marks them as removed from the game, by changing their imageName value
    func completed(){
        let completionImage: String = "circlebadge"
        for item in currentGuesses {
            var matched = false
            for row in 0..<entries.count {
                for col in 0..<entries[row].count{
                    if entries[row][col].id == item.id{
                        entries[row][col].imageName = completionImage
                        matched = true
                        break
                    }
                    if matched {break}
                }
            }
        }
    }
}

///Default Treasure Items array list, used for maintaining the options in Settings, 
class TreasureItems: ObservableObject {
    @Published var entries: [TreasureItem]
    
    init() {
        entries = [TreasureItem]()
        entries.append(TreasureItem(imageName: "questionmark", perGroup: 2, numGroups: 2))
    }
}
