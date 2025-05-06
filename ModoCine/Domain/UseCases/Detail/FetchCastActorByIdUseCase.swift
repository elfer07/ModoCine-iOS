//
//  FetchCastActorByIdUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 18/04/2025.
//

protocol FetchCastActorByIdUseCase {
    func execute(actorId: Int) async throws -> [CastCreditsByActor]
}
