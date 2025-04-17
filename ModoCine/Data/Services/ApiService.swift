//
//  ApiService.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

protocol ApiService {
    func getPopularMovies() async throws -> [MovieDTO]
    func getTopRatedMovies() async throws -> [MovieDTO]
    func getUpcomingMovies() async throws -> [MovieDTO]
    func getSimilarMovies(movieId: Int) async throws -> [MovieDTO]
    func getMovieDetail(movieId: Int) async throws -> MovieDetailDTO
    func getMovieByName(name: String) async throws -> [MovieDTO]
    func getActorsByIdMovie(id: Int) async throws -> [ActorDTO]
}
