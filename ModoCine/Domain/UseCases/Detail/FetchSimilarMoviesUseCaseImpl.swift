//
//  FetchSimilarMoviesUseCaseImpl.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

class FetchSimilarMoviesUseCaseImpl: FetchSimilarMoviesUseCase {
    private let movieRepository: MovieRepository

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    func execute(movieId: Int) async throws -> [Movie] {
        try await movieRepository.fetchSimilarMovies(movieId: movieId)
    }
}
