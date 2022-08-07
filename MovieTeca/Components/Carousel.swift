//
//  Carousel.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 26/07/22.
//

import SwiftUI

struct Carousel: View {
    
    //Atributes
    let width, height, padding: Int
    let navigation: Bool
    let movies: [Movie]?
    let cast: [Cast]?
    
    var body: some View {
        // MARK: - Movie
        ScrollView(.horizontal){
            HStack {
                
                if let moviesList = movies {
                    ForEach(moviesList, id: \.self) { movie in
                        VStack {
                            Card(width: width, height: height, padding: padding, navigation: navigation, movie: movie, cast: nil)
                            Text(movie.title ?? "No title")
                        }
                    }
                }
                
                if let castList = cast {
                    ForEach(castList, id: \.self) { castObj in
                        VStack {
                            Card(width: width, height: height, padding: padding, navigation: navigation, movie: nil, cast: castObj)
                            Text(castObj.name)
                            Text(castObj.character ?? "")
                        }
                    }
                }
            }
        }
        
    }
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        Carousel(width: 240, height: 350, padding: 12, navigation: false, movies: [Movie(adult: false, backdropPath: nil, genreIDS: nil, id: 1, originalLanguage: "", originalTitle: "", overview: nil, popularity: 2, posterPath: nil, releaseDate: nil, title: "The batman", video: false, voteAverage: 2, voteCount: 2)], cast: nil)
    }
}
