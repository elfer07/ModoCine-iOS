//
//  FetchSeriesDetailByIdUseCaseImpl.swift
//  ModoCine
//
//  Created by Fernando Moreno on 05/05/2025.
//

class FetchSeriesDetailByIdUseCaseImpl: FetchSeriesDetailByIdUseCase {
    private let movieRepository: MovieRepository

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func execute(id: Int) async throws -> SeriesDetail {
        return try await movieRepository.fetchSeriesDetailById(id: id)
    }
}
