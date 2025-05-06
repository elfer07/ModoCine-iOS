//
//  Fetc.swift
//  ModoCine
//
//  Created by Fernando Moreno on 05/05/2025.
//

class FetchCastBySeriesIdUseCaseImpl: FetchCastBySeriesIdUseCase {
    private let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func execute(id: Int) async throws -> [Actor] {
        try await movieRepository.fetchActorsByIdSeries(id: id)
    }
}
