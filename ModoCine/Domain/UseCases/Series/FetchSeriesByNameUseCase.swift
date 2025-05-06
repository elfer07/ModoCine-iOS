//
//  FetchSeriesByNameUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 05/05/2025.
//

protocol FetchSeriesByNameUseCase {
    func execute(name: String) async throws -> [Series]
}
