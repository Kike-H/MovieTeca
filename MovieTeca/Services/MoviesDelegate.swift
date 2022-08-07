//
//  MoviesDelegate.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 06/08/22.
//

import Foundation

class MoviesDelegate : ObservableObject {
    @Published var now_playing = [Movie]()
    @Published var popular = [Movie]()

    
    init() {
        getMoviesNowPlaying()
        getMoviesPopular()
    }
    
    func getMoviesNowPlaying () {
        MovieStore.shared.fetchNowPlaying(pag: 1) {result in
            switch result {
            case .success(let moviesResponse):
                self.now_playing.append(contentsOf: moviesResponse.results)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    func getMoviesPopular () {
        MovieStore.shared.fetchPopular(pag: 1) {result in
            switch result {
            case .success(let moviesResponse):
                self.popular.append(contentsOf: moviesResponse.results)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    func reload () {
        self.now_playing.removeAll()
        self.popular.removeAll()
        getMoviesNowPlaying()
        getMoviesPopular()
    }
}
