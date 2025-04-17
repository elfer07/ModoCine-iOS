//
//  FailingFetchMovieDetailUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

import XCTest
@testable import ModoCine

class FailingFetchMovieDetailUseCase: FetchMovieDetailUseCase {
    func execute(movieId: Int) async throws -> MovieDetail {
        throw URLError(.badServerResponse)
    }
}
