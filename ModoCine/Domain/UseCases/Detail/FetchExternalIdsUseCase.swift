//
//  FetchExternalIdsUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 18/04/2025.
//

protocol FetchExternalIdsUseCase {
    func execute(actorId: Int) async throws -> ExternalIdsActor
}
