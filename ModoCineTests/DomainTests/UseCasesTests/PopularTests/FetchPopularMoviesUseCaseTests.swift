//
//  FetchPopularMoviesUseCaseTests.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

import XCTest
@testable import ModoCine

final class FetchPopularMoviesUseCaseTests: XCTestCase {

    func testExecute_ReturnsPopularMovies() async throws {
        let mockRepo = MockMovieRepository()
        mockRepo.popularMoviesToReturn = [.mock(id: 1), .mock(id: 2)]
        let useCase = FetchPopularMoviesUseCaseImpl(movieRepository: mockRepo)
        
        let result = try await useCase.execute()
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[0].id, 1)
    }
}
