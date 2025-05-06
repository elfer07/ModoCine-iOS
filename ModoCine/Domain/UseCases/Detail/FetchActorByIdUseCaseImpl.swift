//
//  FetchActorByIdUseCaseImpl.swift
//  ModoCine
//
//  Created by Fernando Moreno on 18/04/2025.
//

class FetchActorByIdUseCaseImpl: FetchActorByIdUseCase {
    private let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func execute(actorId: Int) async throws -> DetailActor {
        try await movieRepository.fetchActorById(actorId: actorId)
    }
}
