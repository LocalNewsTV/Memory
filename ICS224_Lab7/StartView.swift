//
//  ContentView.swift
//  ICS224_Lab7
//
//  Created by ICS 224 on 2023-02-08.
//

import SwiftUI

struct StartView: View {
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
            .navigationBarTitle(Text("Rules"))
        }
    }
}


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
