//
//  FailingPopularMoviesUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

import XCTest
@testable import ModoCine

class FailingPopularMoviesUseCase: FetchPopularMoviesUseCase {
    func execute() async throws -> [Movie] {
        throw URLError(.badServerResponse)
    }
}
