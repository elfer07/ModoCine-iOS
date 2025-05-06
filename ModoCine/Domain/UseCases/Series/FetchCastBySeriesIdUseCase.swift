//
//  FetchCastBySeriesIdUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 05/05/2025.
//

protocol FetchCastBySeriesIdUseCase {
    func execute(id: Int) async throws -> [Actor]
}
