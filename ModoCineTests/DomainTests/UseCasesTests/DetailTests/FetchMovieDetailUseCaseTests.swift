//
//  FetchMovieDetailUseCaseTests.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

import XCTest
@testable import ModoCine

class FetchMovieDetailUseCaseTests: XCTestCase {
    
    func testExecute_ReturnsMovieDetail() async throws {
        // Arrange
        let mockRepo = MockMovieRepository()
        let expectedMovieDetail = MovieDetail.mock(id: 1)
        mockRepo.movieDetailToReturn = .mock(id: 1)
        
        let useCase = FetchMovieDetailUseCaseImpl(movieRepository: mockRepo)

        // Act
        let movieDetail = try await useCase.execute(movieId: 1)

        // Assert
        XCTAssertEqual(movieDetail.id, expectedMovieDetail.id)
        XCTAssertEqual(movieDetail.title, expectedMovieDetail.title)
        XCTAssertEqual(movieDetail.genres.count, expectedMovieDetail.genres.count)
    }
}
