//
//  Main.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 25/07/22.
//

import SwiftUI


struct MainView: View {
    let movies:[Movie] = [Movie(adult: false, backdropPath: "", genreIDS: [1,2,3], id: 1, originalLanguage: "en", originalTitle: "", overview: "", popularity: 2.5, posterPath: "https://cdn.mos.cms.futurecdn.net/p7LYq5FN4SAHk7sYp6zZog.jpg", releaseDate: "", title: "Batman V Superman", video: false, voteAverage: 2.6, voteCount: 2), Movie(adult: false, backdropPath: "", genreIDS: [1,2,3], id: 1, originalLanguage: "en", originalTitle: "The Batman", overview: "", popularity: 2.5, posterPath: "https://cdn.mos.cms.futurecdn.net/p7LYq5FN4SAHk7sYp6zZog.jpg", releaseDate: "", title: "The Batman", video: false, voteAverage: 2.6, voteCount: 4)]
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    SeccionTitle(title: "New Movies", width: 150)
                    Carousel(width: 240, height: 350, padding: 12, navigation: true, movies: movies)
                    Spacer()
                    SeccionTitle(title: "Popular Movies", width: 180)
                    Carousel(width: 160, height: 250, padding: 8, navigation: true, movies: movies)
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
