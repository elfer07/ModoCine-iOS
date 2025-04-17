//
//  FetchCastByMovieIdUseCaseImpl.swift
//  ModoCine
//
//  Created by Fernando Moreno on 14/04/2025.
//

class FetchCastByMovieIdUseCaseImpl: FetchCastByMovieIdUseCase {
    private let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func execute(movieId: Int) async throws -> [Actor] {
        try await movieRepository.fetchActorsByMovieId(movieId: movieId)
    }
}
