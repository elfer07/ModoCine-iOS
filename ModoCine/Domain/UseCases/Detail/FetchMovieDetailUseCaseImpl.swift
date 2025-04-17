//
//  FetchMovieDetailUseCaseImpl.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

class FetchMovieDetailUseCaseImpl: FetchMovieDetailUseCase {
    private let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func execute(movieId: Int) async throws -> MovieDetail {
        try await movieRepository.fetchMovieDetail(movieId: movieId)
    }
}
