//
//  MovieRemote.swift
//  Movie Listing
//
//  Created by Mahmoud Alaa on 23/07/2025.
//
import Foundation
import Combine

protocol MovieRemoteProtocol {
    func fetchConfiguration() -> AnyPublisher<ConfigurationResponse, Error>
    func fetchTopMovies(year: Int) -> AnyPublisher<MovieListResponse, Error>
    func fetchMovieDetails(id: Int) -> AnyPublisher<MovieDetails, Error>
}

class MovieRemote: Remote, MovieRemoteProtocol {
    func fetchConfiguration() -> AnyPublisher<ConfigurationResponse, Error> {
        let request = MovieDBRequest(endpoint: .configuration)
        return enqueue(request)
    }
    
    func fetchTopMovies(year: Int = 2025) -> AnyPublisher<MovieListResponse, Error> {
        let request = MovieDBRequest(endpoint: .discoverMovies(year: year))
        return enqueue(request)
    }
    
    func fetchMovieDetails(id: Int) -> AnyPublisher<MovieDetails, Error> {
        let request = MovieDBRequest(endpoint: .movieDetails(id: id))
        return enqueue(request)
    }
}
