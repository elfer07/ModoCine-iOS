//
//  MovieRepositoryImpl.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

class MovieRepositoryImpl: MovieRepository {
    
    private let apiService: ApiService

    init(apiService: ApiService = ApiServiceImpl()) {
        self.apiService = apiService
    }
    
    func fetchUpcomingMovies() async throws -> [Movie] {
        let movies = try await apiService.getUpcomingMovies()
        return movies.map { $0.toDomain() }
    }
    
    func fetchTopRatedMovies() async throws -> [Movie] {
        let movies = try await apiService.getTopRatedMovies()
        return movies.map { $0.toDomain() }
    }

    func fetchPopularMovies() async throws -> [Movie] {
        let movies = try await apiService.getPopularMovies()
        return movies.map { $0.toDomain() }
    }
    
    func fetchSimilarMovies(movieId: Int) async throws -> [Movie] {
        let similarMovies = try await apiService.getSimilarMovies(movieId: movieId)
        return similarMovies.map { $0.toDomain() }
    }
    
    func fetchMovieDetail(movieId: Int) async throws -> MovieDetail {
        let movieDetail = try await apiService.getMovieDetail(movieId: movieId)
        return movieDetail.toDomain()
    }
    
    func fetchMoviesByName(name: String) async throws -> [Movie] {
        let movies = try await apiService.getMovieByName(name: name)
        return movies.map { $0.toDomain() }
    }
    
    func fetchActorsByMovieId(movieId: Int) async throws -> [Actor] {
        let actorsDto = try await apiService.getActorsByIdMovie(id: movieId)
        return actorsDto.map { $0.toDomain() }
    }
}
