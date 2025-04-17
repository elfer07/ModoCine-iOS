//
//  FailingFetchCastByMovieIdUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

import XCTest
@testable import ModoCine

class FailingFetchCastByMovieIdUseCase: FetchCastByMovieIdUseCase {
    func execute(movieId: Int) async throws -> [Actor] {
        throw URLError(.cannotFindHost)
    }
}
