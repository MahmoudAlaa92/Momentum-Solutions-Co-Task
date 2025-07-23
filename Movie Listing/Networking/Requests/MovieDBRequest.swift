//
//  MovieDBRequest.swift
//  Movie Listing
//
//  Created by Mahmoud Alaa on 23/07/2025.
//

// MovieDBRequest.swift
import Alamofire
import Foundation

/// TheMovieDB API Request
struct MovieDBRequest: URLRequestConvertible {
    enum Endpoint {
        case configuration
        case discoverMovies(year: Int, sortBy: String = "vote_average.desc")
        case movieDetails(id: Int)
        
        var path: String {
            switch self {
            case .configuration: return "configuration"
            case .discoverMovies: return "discover/movie"
            case .movieDetails(let id): return "movie/\(id)"
            }
        }
        
        var parameters: [String: Any] {
            var params: [String: Any] = ["api_key": Secrets.tmdbAPIKey]
            
            switch self {
            case .discoverMovies(let year, let sortBy):
                params["primary_release_year"] = year
                params["sort_by"] = sortBy
            default: break
            }
            
            return params
        }
    }
    
    /// HTTP Request Method
    let method: HTTPMethod
    
    /// Endpoint definition
    let endpoint: Endpoint
    
    /// Designated Initializer
    init(method: HTTPMethod = .get, endpoint: Endpoint) {
        self.method = method
        self.endpoint = endpoint
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: Settings.storeApiBaseURL + endpoint.path)!
        var request = URLRequest(url: url)
        request.method = method
        
        return try URLEncoding.default.encode(request, with: endpoint.parameters)
    }
}
