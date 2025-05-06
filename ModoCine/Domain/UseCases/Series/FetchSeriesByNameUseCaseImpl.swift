//
//  FetchSeriesByNameUseCaseImpl.swift
//  ModoCine
//
//  Created by Fernando Moreno on 05/05/2025.
//

class FetchSeriesByNameUseCaseImpl: FetchSeriesByNameUseCase {
    private let movieRepository: MovieRepository

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func execute(name: String) async throws -> [Series] {
        return try await movieRepository.fetchSeriesByName(name: name)
    }
}
