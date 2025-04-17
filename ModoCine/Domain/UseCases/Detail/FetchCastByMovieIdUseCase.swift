//
//  FetchCastByMovieIdUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 14/04/2025.
//

protocol FetchCastByMovieIdUseCase {
    func execute(movieId: Int) async throws -> [Actor]
}
