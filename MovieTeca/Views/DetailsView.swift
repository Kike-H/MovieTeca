//
//  Details.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 28/07/22.
//

import SwiftUI


struct DetailsView: View {
    //Atributes
    let movie: Movie
    @StateObject var castDelegate = CastDelegate()
    
    var body: some View {
        ScrollView{
            VStack {
                HStack {
// MARK: - CardMovie
                    Card(width: 140, height: 200, padding: 12, navigation: false, movie: movie, cast: nil)
// MARK: - CardMovie
                    
// MARK: - Movie Information
                    
// MARK: - Movie Titles
                    VStack {
                        Text(movie.title ?? "")
                            .font(.title)
                            .lineLimit(1)
                        Text(movie.originalTitle ?? "No secondary title")
                            .lineLimit(1)
                            .font(.title2)
                        
// MARK: - Movie Titles
                        
// MARK: - Vote Stars
                        HStack {
                            if(movie.voteAverage != nil) {
                                ForEach(1..<6) { star in
                                    let avg = Int(movie.voteAverage!/2)
                                    if(star <= avg) {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.indigo)
                                    }
                                    else {
                                        Image(systemName: "star")
                                            .foregroundColor(.indigo)
                                    }
                                }
                            }
                            else {
                                Text("No vote information")
                            }
                        } // HStack
// MARK: - Vote Stars
                    } //Vstack
// MARK: - Movie Information
                    Spacer()
                } //HStack
                SeccionTitle(title: "Synopsis", width: 123)
                VStack {
                    Text(movie.overview ?? "No overview information")
                        .padding(.horizontal)
                }
                .multilineTextAlignment(.leading)
                SeccionTitle(title: "Cast", width: 100)
                    .onAppear {
                        castDelegate.getCastMovie(id: movie.id)
                    }
                Carousel(width: 130, height: 170, padding: 12, navigation: false, movies: nil, cast: castDelegate.casting)
             
            } //Vstack
        } // ScrollView
        .navigationTitle(Text(movie.title ?? "No title"))
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(movie: Movie(adult: true, backdropPath: nil, genreIDS: nil, id: 1, originalLanguage: nil, originalTitle: nil, overview: nil, popularity: 2, posterPath: nil, releaseDate: nil, title: "The batman ajajsjsjsjsjsjsjsjsjsjsjsjsj", video: false, voteAverage: 2, voteCount: 1))
    }
}
