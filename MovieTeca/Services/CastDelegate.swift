//
//  MoviesDelegate.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 06/08/22.
//

import Foundation

class CastDelegate : ObservableObject {
    
    @Published var casting = [Cast]()
    
    init() {}
    
    func getCastMovie (id: Int){
        CastStore.shared.fetchCast(idMovie: id) { result in
            switch result {
            case .success(let castResponse):
                self.casting.append(contentsOf: castResponse.cast)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
