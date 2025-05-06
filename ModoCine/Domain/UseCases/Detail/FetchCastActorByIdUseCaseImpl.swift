//
//  Untitled.swift
//  ModoCine
//
//  Created by Fernando Moreno on 18/04/2025.
//

class FetchCastActorByIdUseCaseImpl: FetchCastActorByIdUseCase {
    private let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func execute(actorId: Int) async throws -> [CastCreditsByActor] {
        try await movieRepository.fetchCastByActorId(actorId: actorId)
    }
}
