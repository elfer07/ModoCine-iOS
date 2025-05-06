//
//  FetchExternalIdsUseCaseImpl.swift
//  ModoCine
//
//  Created by Fernando Moreno on 18/04/2025.
//

class FetchExternalIdsUseCaseImpl: FetchExternalIdsUseCase {
    private let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func execute(actorId: Int) async throws -> ExternalIdsActor {
        try await movieRepository.fetchExternalIds(actorId: actorId)
    }
}
