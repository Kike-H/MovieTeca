//
//  SearchModel.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 09/08/22.
//

import Foundation

struct SearchModel: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
