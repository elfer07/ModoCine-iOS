//
//  MockFetchMovieDetailUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

import XCTest
@testable import ModoCine

class MockFetchMovieDetailUseCase: FetchMovieDetailUseCase {
    var result: Swift.Result<MovieDetail, Error> = .success(MovieDetail.mock())
    
    func execute(movieId: Int) async throws -> MovieDetail {
        switch result {
        case .success(let detail): return detail
        case .failure(let error): throw error
        }
    }
}
