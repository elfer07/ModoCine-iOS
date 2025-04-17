//
//  FailingUpcomingMoviesUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

import XCTest
@testable import ModoCine

class FailingUpcomingMoviesUseCase: FetchUpcomingMoviesUseCase {
    func execute() async throws -> [Movie] {
        throw URLError(.timedOut)
    }
}
