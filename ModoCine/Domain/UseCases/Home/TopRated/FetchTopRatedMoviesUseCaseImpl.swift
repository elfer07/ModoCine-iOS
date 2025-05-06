//
//  FetchTopRatedMoviesUseCaseImpl.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

class FetchTopRatedMoviesUseCaseImpl: FetchTopRatedMoviesUseCase {
    private let movieRepository: MovieRepository

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    func execute() async throws -> [Movie] {
        try await movieRepository.fetchTopRatedMovies()
    }
}
