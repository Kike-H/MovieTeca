//
//  MoviesService.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 06/08/22.
//

import Foundation
import Alamofire
import SwiftUI

protocol CastService {
    func fetchCast(idMovie: Int, complettion: @escaping(Result<CastMovie, Error>) -> ())
}

class CastStore: CastService {
    
    // MARK: - Singleton
    static let shared = CastStore()
    
    @Environment(\.myAPIKEY) var APIKEY
    private let baseAPIURL = "https://api.themoviedb.org/3"
    private let movieLenguaje = "&language=en-US"
    
    private init() {}
    
    
    // MARK: - Implementation of protocol
    func fetchCast(idMovie: Int, complettion: @escaping (Result<CastMovie, Error>) -> ()) {
        AF.request(baseAPIURL + "/movie/\(idMovie)/credits?api_key=" + APIKEY + movieLenguaje)
            .responseDecodable(of: CastMovie.self) { response in
                guard let cast = response.value else {
                    if let error = response.error {
                        complettion(.failure(error))
                    }
                    return
                }
                complettion(.success(cast))
            }
    }

}
