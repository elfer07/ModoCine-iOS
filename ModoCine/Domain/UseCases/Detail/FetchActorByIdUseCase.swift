//
//  FetchActorByIdUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 18/04/2025.
//

protocol FetchActorByIdUseCase {
    func execute(actorId: Int) async throws -> DetailActor
}
