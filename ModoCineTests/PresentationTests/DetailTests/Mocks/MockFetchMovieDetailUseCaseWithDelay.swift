//
//  MockFetchMovieDetailUseCaseWithDelay.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

import XCTest
@testable import ModoCine

class MockFetchMovieDetailUseCaseWithDelay: FetchMovieDetailUseCase {
    var result: Swift.Result<MovieDetail, Error> = .success(.mock())
    var delay: TimeInterval

    init(delay: TimeInterval = 0.0) {
        self.delay = delay
    }

    func execute(movieId: Int) async throws -> MovieDetail {
        try await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
        switch result {
        case .success(let movie): return movie
        case .failure(let error): throw error
        }
    }
}
