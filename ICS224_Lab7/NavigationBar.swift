//
//  NavigationBar.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-08.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        NavigationStack(){
            VStack{}
                
        }
            .toolbar {
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

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
