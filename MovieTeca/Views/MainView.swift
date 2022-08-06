//
//  Main.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 25/07/22.
//

import SwiftUI
import Alamofire



struct MainView: View {
    @StateObject var moviesDelegate = MoviesDelegate()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    SeccionTitle(title: "New Movies", width: 150)
                    Carousel(width: 240, height: 350, padding: 12, navigation: true, movies: moviesDelegate.now_playing)
                    Spacer()
                    SeccionTitle(title: "Popular Movies", width: 180)
                    Carousel(width: 160, height: 250, padding: 8, navigation: true, movies: moviesDelegate.popular)
                } //VStack
            } //Scroll View
            
            //Navigation Tittle
            .navigationTitle(Text("MovieTeca v0.3"))
            
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
        MainView()
    }
}
