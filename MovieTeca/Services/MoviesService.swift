//
//  MoviesService.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 06/08/22.
//

import Foundation
import Alamofire
import SwiftUI

protocol MovieService {
    func fetchNowPlaying(pag: Int, complettion: @escaping(Result<NowPlaying, Error>) -> ())
    func fetchPopular(pag: Int, complettion: @escaping(Result<NowPlaying, Error>) -> ())
}

class MovieStore: MovieService {
    
    // MARK: - Singleton
    static let shared = MovieStore()
    
    private let APIKEY = "API_KEY"
    private let baseAPIURL = "https://api.themoviedb.org/3"
    
    private init() {}
    
    
    // MARK: - Implementation of protocol
    func fetchNowPlaying(pag: Int, complettion: @escaping (Result<NowPlaying, Error>) -> ()) {
        AF.request(baseAPIURL + "/movie/now_playing?api_key=" + APIKEY + "&language=en-US&page=\(pag)")
            .responseDecodable(of: NowPlaying.self) { response in
                guard let movies = response.value else {
                    if let error = response.error {
                        complettion(.failure(error))
                    }
                    return
                }
                complettion(.success(movies))
            }
    }
    func fetchPopular(pag: Int, complettion: @escaping (Result<NowPlaying, Error>) -> ()) {
        AF.request(baseAPIURL + "/movie/popular?api_key=" + APIKEY + "&language=en-US&page=\(pag)")
            .responseDecodable(of: NowPlaying.self) { response in
                guard let movies = response.value else {
                    if let error = response.error {
                        complettion(.failure(error))
                    }
                    return
                }
                complettion(.success(movies))
            }
    }
    

}
