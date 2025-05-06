//
//  FetchMoviesByNameUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 17/04/2025.
//

protocol FetchMoviesByNameUseCase {
    func execute(name: String) async throws -> [Movie]
}
