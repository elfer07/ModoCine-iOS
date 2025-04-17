//
//  FetchSimilarMoviesUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

protocol FetchSimilarMoviesUseCase {
    func execute(movieId: Int) async throws -> [Movie]
}
