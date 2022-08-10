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
    func fetchSearchMovies(nameMovie: String, complettion: @escaping(Result<SearchModel, Error>) -> ())
}

class MovieStore: MovieService {
    
    // MARK: - Singleton
    static let shared = MovieStore()
    
    @Environment(\.myAPIKEY) var APIKEY
    private let baseAPIURL = "https://api.themoviedb.org/3"
    private let movieLenguaje = "&language=en-US"
    
    private init() {}
    
    
    // MARK: - Implementation of protocol
    
    // MARK: - Get recnet movies
    func fetchNowPlaying(pag: Int, complettion: @escaping (Result<NowPlaying, Error>) -> ()) {
        AF.request(baseAPIURL + "/movie/now_playing?api_key=" + APIKEY + movieLenguaje + "&page=\(pag)")
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
    
    // MARK: - Get popular movies
    func fetchPopular(pag: Int, complettion: @escaping (Result<NowPlaying, Error>) -> ()) {
        AF.request(baseAPIURL + "/movie/popular?api_key=" + APIKEY + movieLenguaje + "&page=\(pag)")
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
    // MARK: - Get popular movies
    func fetchSearchMovies(nameMovie: String, complettion: @escaping (Result<SearchModel, Error>) -> ()) {
        AF.request(baseAPIURL + "/search/movie?api_key=" + APIKEY + movieLenguaje + "&query=\(nameMovie)&page=1&include_adult=false")
            .responseDecodable(of: SearchModel.self) { response in
                debugPrint(response)
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
