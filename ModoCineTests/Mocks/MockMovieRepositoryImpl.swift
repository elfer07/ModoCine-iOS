//
//  MockMovieRepository.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

import XCTest
@testable import ModoCine

class MockMovieRepository: MovieRepository {
    var popularMoviesToReturn: [Movie] = []
    var topRatedMoviesToReturn: [Movie] = []
    var upcomingMoviesToReturn: [Movie] = []
    var movieDetailToReturn: MovieDetail = .mock(id: 1)

    func fetchPopularMovies() async throws -> [Movie] {
        popularMoviesToReturn
    }

    func fetchTopRatedMovies() async throws -> [Movie] {
        topRatedMoviesToReturn
    }

    func fetchUpcomingMovies() async throws -> [Movie] {
        upcomingMoviesToReturn
    }

    func fetchSimilarMovies(movieId: Int) async throws -> [Movie] { [] }

    func fetchMovieDetail(movieId: Int) async throws -> MovieDetail {
        movieDetailToReturn
    }

    func fetchActorsByMovieId(movieId: Int) async throws -> [Actor] { [] }

    func fetchMoviesByName(name: String) async throws -> [Movie] { [] }
}
