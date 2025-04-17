//
//  FetchPopularMoviesUseCaseImpl.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

class FetchPopularMoviesUseCaseImpl: FetchPopularMoviesUseCase {
    private let movieRepository: MovieRepository

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    func execute() async throws -> [Movie] {
        try await movieRepository.fetchPopularMovies()
    }
}
