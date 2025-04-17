//
//  MockApiService.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

import XCTest
@testable import ModoCine

class MockApiService: ApiService {
    var popularMoviesResult: [MovieDTO] = []
    var topRatedMoviesResult: [MovieDTO] = []
    var upcomingMoviesResult: [MovieDTO] = []
    var movieDetailResult: MovieDetailDTO = .mock()
    
    var popularMoviesResultError: Error? = nil
    var topRatedMoviesResultError: Error? = nil
    var upcomingMoviesResultError: Error? = nil
    var movieDetailResultError: Error? = nil

    func getPopularMovies() async throws -> [MovieDTO] {
        if let error = popularMoviesResultError {
            throw error
        }
        return popularMoviesResult
    }
    func getTopRatedMovies() async throws -> [MovieDTO] {
        if let error = topRatedMoviesResultError {
            throw error
        }
        return topRatedMoviesResult
    }
    func getUpcomingMovies() async throws -> [MovieDTO] {
        if let error = upcomingMoviesResultError {
            throw error
        }
        return upcomingMoviesResult
    }
    func getSimilarMovies(movieId: Int) async throws -> [MovieDTO] { [] }
    func getMovieDetail(movieId: Int) async throws -> MovieDetailDTO {
        if let error = movieDetailResultError {
            throw error
        }
        return movieDetailResult
    }
    func getMovieByName(name: String) async throws -> [MovieDTO] { [] }
    func getActorsByIdMovie(id: Int) async throws -> [ActorDTO] { [] }
}
