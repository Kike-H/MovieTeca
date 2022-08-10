//
//  SearchService.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 09/08/22.
//

import Foundation

class SearchDelegate : ObservableObject {
    
    @Published var moviesSearching = [Movie]()
    
    init() {}
    
    func searchMovie (nameMovie: String) {
        let nameMovieParsed = nameMovie.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        MovieStore.shared.fetchSearchMovies(nameMovie: nameMovieParsed!) { result in
            switch result {
            case .success(let moviesResponse):
                self.moviesSearching.append(contentsOf: moviesResponse.results)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
