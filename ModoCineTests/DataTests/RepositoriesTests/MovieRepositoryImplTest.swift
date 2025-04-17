//
//  MovieRepositoryImplTest.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

import XCTest
@testable import ModoCine

final class MovieRepositoryImplTests: XCTestCase {

    var repository: MovieRepositoryImpl!
    var mockApiService: MockApiService!

    override func setUp() {
        super.setUp()
        mockApiService = MockApiService()
        repository = MovieRepositoryImpl(apiService: mockApiService)
    }

    func testFetchPopularMovies_ReturnsMappedMovies() async throws {
        mockApiService.popularMoviesResult = [.mock(id: 1), .mock(id: 2)]
        let movies = try await repository.fetchPopularMovies()
        XCTAssertEqual(movies.count, 2)
        XCTAssertEqual(movies[0].id, 1)
    }
    
    func testFetchTopRatedMovies_ReturnsMappedMovies() async throws {
        mockApiService.topRatedMoviesResult = [.mock(id: 1), .mock(id: 2), .mock(id: 3)]
        let moviess = try await repository.fetchTopRatedMovies()
        XCTAssertEqual(moviess.count, 3)
        XCTAssertEqual(moviess[1].id, 2)
    }

    func testFetchMovieDetail_ReturnsMovieDetail() async throws {
        mockApiService.movieDetailResult = .mock(id: 1)
        let detail = try await repository.fetchMovieDetail(movieId: 1)
        XCTAssertEqual(detail.id, 1)
    }
    
    func testFetchPopularMovies_ThrowsError() async {
        mockApiService.popularMoviesResultError = NSError(domain: "test", code: 1, userInfo: nil)

        do {
            _ = try await repository.fetchPopularMovies()
            XCTFail("Expected error, but got success")
        } catch {
            XCTAssertNotNil(error)
        }
    }
    
    func testFetchMovieDetail_ThrowsError() async {
        mockApiService.movieDetailResultError = NSError(domain: "test", code: 1, userInfo: nil)
        
        do {
            _ = try await repository.fetchMovieDetail(movieId: 1)
            XCTFail("Expected error, but got success")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
