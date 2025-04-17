//
//  FetchPopularMoviesUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

protocol FetchPopularMoviesUseCase {
    func execute() async throws -> [Movie]
}
