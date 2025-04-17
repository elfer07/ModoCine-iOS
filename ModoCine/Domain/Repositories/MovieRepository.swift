//
//  MovieRepository.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

protocol MovieRepository {
    func fetchPopularMovies() async throws -> [Movie]
    func fetchTopRatedMovies() async throws -> [Movie]
    func fetchUpcomingMovies() async throws -> [Movie]
    func fetchSimilarMovies(movieId: Int) async throws -> [Movie]
    func fetchMovieDetail(movieId: Int) async throws -> MovieDetail
    func fetchActorsByMovieId(movieId: Int) async throws -> [Actor]
    func fetchMoviesByName(name: String) async throws -> [Movie]
}
