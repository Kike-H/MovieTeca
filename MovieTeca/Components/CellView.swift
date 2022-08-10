//
//  CellView.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 09/08/22.
//

import SwiftUI

struct CellView: View {
    let movie: Movie
    var body: some View {
        NavigationLink(destination: DetailsView(movie: movie)) {
            HStack {
                Card(width: 100, height: 140, padding: 8, navigation: true, movie: movie, cast: nil)
                Text(movie.title ?? "No tittle")
                    .font(.title3)
                    .lineLimit(2)
            }
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(movie: Movie(adult: true, backdropPath: "", genreIDS: nil, id: 1, originalLanguage: "", originalTitle: "", overview: "", popularity: 2.3, posterPath: "", releaseDate: nil, title: "", video: false, voteAverage: nil, voteCount: nil))
    }
}
