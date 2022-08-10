//
//  SearchView.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 09/08/22.
//

import SwiftUI

struct SearchView: View {
    @State private var movieName: String = ""
    @StateObject var searchDelegate = SearchDelegate()
    
    var body: some View {
        List (searchDelegate.moviesSearching) { movie in
            CellView(movie: movie)
        }
        .searchable(
            text: $movieName,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search a movie"
        )
        .onChange(of: movieName) { value in
            searchDelegate.moviesSearching.removeAll()
            if(!value.isEmpty) {
                searchDelegate.searchMovie(nameMovie: value)
            }
        }
        .navigationTitle("Searching movie\(movieName)")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
