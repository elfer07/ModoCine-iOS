//
//  FetchMoviesByNameUseCaseImpl.swift
//  ModoCine
//
//  Created by Fernando Moreno on 17/04/2025.
//

class FetchMoviesByNameUseCaseImpl: FetchMoviesByNameUseCase {
    private let movieRepository: MovieRepository

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func execute(name: String) async throws -> [Movie] {
        return try await movieRepository.fetchMoviesByName(name: name)
    }
}
