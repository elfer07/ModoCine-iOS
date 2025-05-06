//
//  FetchSeasonBySeriesIdUseCaseImpl.swift
//  ModoCine
//
//  Created by Fernando Moreno on 05/05/2025.
//

class FetchSeasonBySeriesIdUseCaseImpl: FetchSeasonBySeriesIdUseCase {
    private let movieRepository: MovieRepository

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func execute(id: Int, season: Int) async throws -> SeriesSeason {
        return try await movieRepository.fetchSeasonBySeriesId(id: id, season: season)
    }
}
