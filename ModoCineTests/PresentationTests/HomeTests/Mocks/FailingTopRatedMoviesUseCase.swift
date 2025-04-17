//
//  FailingTopRatedMoviesUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

import XCTest
@testable import ModoCine

class FailingTopRatedMoviesUseCase: FetchTopRatedMoviesUseCase {
    func execute() async throws -> [Movie] {
        throw URLError(.notConnectedToInternet)
    }
}
