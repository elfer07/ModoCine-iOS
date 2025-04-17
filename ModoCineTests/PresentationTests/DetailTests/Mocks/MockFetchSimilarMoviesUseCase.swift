//
//  MockFetchSimilarMoviesUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

import XCTest
@testable import ModoCine

class MockFetchSimilarMoviesUseCase: FetchSimilarMoviesUseCase {
    var result: Swift.Result<[Movie], Error> = .success([Movie.mock()])
    
    func execute(movieId: Int) async throws -> [Movie] {
        switch result {
        case .success(let movies): return movies
        case .failure(let error): throw error
        }
    }
}
