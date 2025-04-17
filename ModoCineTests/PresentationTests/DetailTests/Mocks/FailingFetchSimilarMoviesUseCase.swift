//
//  FailingFetchSimilarMoviesUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

import XCTest
@testable import ModoCine

class FailingFetchSimilarMoviesUseCase: FetchSimilarMoviesUseCase {
    func execute(movieId: Int) async throws -> [Movie] {
        throw URLError(.timedOut)
    }
}
