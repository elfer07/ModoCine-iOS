//
//  FetchMovieDetailUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

protocol FetchMovieDetailUseCase {
    func execute(movieId: Int) async throws -> MovieDetail
}
