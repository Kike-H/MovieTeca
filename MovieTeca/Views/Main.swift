//
//  Main.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 25/07/22.
//

import SwiftUI

let colors:[Color] = [.red, .indigo, .green, .orange, .blue]
let num = colors.count
// 240 350
// 140 250

struct Main: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    SeccionTitle(title: "New Movies", width: 150)
                    Carousel(width: 240, height: 350, padding: 12)
                    Spacer()
                    SeccionTitle(title: "Popular Movies", width: 180)
                    Carousel(width: 160, height: 250, padding: 8)
                } //VStack
            } //Scroll View
            
            //Navigation Tittle
            .navigationTitle(Text("MovieTeca v0.2"))
            
            // ToolBar Button
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        print("Hello")
                    } label: {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                } // Group
            } //ToolBar
        }// Navigation View
        .accentColor(.indigo)
    }
}


struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
