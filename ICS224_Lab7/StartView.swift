//
//  ContentView.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack(){
            VStack {
                Text("Welcome to the ICS 224 Memory Game\n")
                Image(systemName: "tortoise")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("\nThe aim is to uncover identical images, without uncovering a mismatching image in the process. If a certain number of identical images have been revealed, they are removed from the game.\n")
                Text("The exact number of identical images that must be uncovered before they are removed depends on the image, and can be set from the Settings tab.\n")
                Text("If a mismatched image is selected, all revealed images are hidden again.\nThe game ends when all images have been removed from the game.")
                
            }
            .padding()
            .toolbar{
                ToolbarItem(placement: .bottomBar){
                    if true {
                        Button(
                            action: {
                                withAnimation {
                                    print("Start Button")
                                }
                            }
                        ){
                            Text("Start")
                        }
                        .accessibilityIdentifier("StartNavButton")
                    }
                    
                }
                ToolbarItem(placement: .bottomBar){Spacer()}
                
                ToolbarItem(placement: .bottomBar){
                    if true {
                        Button(
                            action: {
                                withAnimation {
                                    print("Game Button")
                                }
                            }
                        ){
                            Text("Game")
                        }
                        .accessibilityIdentifier("GameNavButton")
                    }
                    
                }
                
                ToolbarItem(placement: .bottomBar){Spacer()}
                
                
                ToolbarItem(placement: .bottomBar){
                    if true {
                        Button(
                            action: {
                                withAnimation {
                                    print("Settings Button")
                                }
                            }
                        ){
                            Text("Settings")
                        }
                        .accessibilityIdentifier("SettingsBarButton")
                        
                    }
                    
                }

            }
        }
        
    }
    }


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
