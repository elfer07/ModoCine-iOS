//
//  MockFetchCastByMovieIdUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

import XCTest
@testable import ModoCine

class MockFetchCastByMovieIdUseCase: FetchCastByMovieIdUseCase {
    var result: Swift.Result<[Actor], Error> = .success([Actor.mock()])
    
    func execute(movieId: Int) async throws -> [Actor] {
        switch result {
        case .success(let actors): return actors
        case .failure(let error): throw error
        }
    }
}
