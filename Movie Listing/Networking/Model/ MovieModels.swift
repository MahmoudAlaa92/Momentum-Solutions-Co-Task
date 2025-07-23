//
//   MovieModels.swift
//  Movie Listing
//
//  Created by Mahmoud Alaa on 23/07/2025.
//

import Foundation

struct ConfigurationResponse: Decodable {
    let images: ImageConfiguration
    
    struct ImageConfiguration: Decodable {
        let secureBaseUrl: String
        let posterSizes: [String]
        
        enum CodingKeys: String, CodingKey {
            case secureBaseUrl = "secure_base_url"
            case posterSizes = "poster_sizes"
        }
    }
}

struct MovieListResponse: Decodable {
    let results: [Movie]
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case results
        case totalPages = "total_pages"
    }
}

struct Movie: Decodable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let releaseDate: String
    let voteAverage: Double
    let originalLanguage: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case originalLanguage = "original_language"
    }
}

struct MovieDetails: Decodable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let releaseDate: String
    let voteAverage: Double
    let originalLanguage: String
    let runtime: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case originalLanguage = "original_language"
        case runtime
    }
}
