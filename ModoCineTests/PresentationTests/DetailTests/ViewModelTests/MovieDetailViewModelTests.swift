//
//  MovieDetailViewModelTests.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

import XCTest
import Combine
@testable import ModoCine

@MainActor
final class MovieDetailViewModelTests: XCTestCase {
    
    func testFetchMovieDetailSuccess() async {
        let mockDetailUseCase = MockFetchMovieDetailUseCase()
        let viewModel = MovieDetailViewModel(
            fetchMovieDetailUseCase: mockDetailUseCase,
            fetchCastByMovieIdUseCase: MockFetchCastByMovieIdUseCase(),
            fetchSimilarMoviesUseCase: MockFetchSimilarMoviesUseCase()
        )

        await viewModel.fetchMovieDetail(movieId: 1)

        XCTAssertNotNil(viewModel.movieDetail)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertEqual(viewModel.movieDetail?.id, 1)
    }

    func testFetchCastSuccess() async {
        let viewModel = MovieDetailViewModel(
            fetchMovieDetailUseCase: MockFetchMovieDetailUseCase(),
            fetchCastByMovieIdUseCase: MockFetchCastByMovieIdUseCase(),
            fetchSimilarMoviesUseCase: MockFetchSimilarMoviesUseCase()
        )

        await viewModel.fetchCastByMovieId(movieId: 1)

        XCTAssertNotNil(viewModel.cast)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testFetchSimilarMoviesSuccess() async {
        let viewModel = MovieDetailViewModel(
            fetchMovieDetailUseCase: MockFetchMovieDetailUseCase(),
            fetchCastByMovieIdUseCase: MockFetchCastByMovieIdUseCase(),
            fetchSimilarMoviesUseCase: MockFetchSimilarMoviesUseCase()
        )

        await viewModel.fetchSimilarMovies(movieId: 1)

        XCTAssertNotNil(viewModel.similarMovies)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    func testFetchMovieDetailFailure() async {
        let viewModel = MovieDetailViewModel(
            fetchMovieDetailUseCase: FailingFetchMovieDetailUseCase(),
            fetchCastByMovieIdUseCase: MockFetchCastByMovieIdUseCase(),
            fetchSimilarMoviesUseCase: MockFetchSimilarMoviesUseCase()
        )

        await viewModel.fetchMovieDetail(movieId: 1)

        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertNil(viewModel.movieDetail)
        XCTAssertEqual(viewModel.errorMessage, "Hubo un error al obtener el detalle de la película.")
        XCTAssertFalse(viewModel.isLoading)
    }

    func testFetchCastFailure() async {
        let viewModel = MovieDetailViewModel(
            fetchMovieDetailUseCase: MockFetchMovieDetailUseCase(),
            fetchCastByMovieIdUseCase: FailingFetchCastByMovieIdUseCase(),
            fetchSimilarMoviesUseCase: MockFetchSimilarMoviesUseCase()
        )

        await viewModel.fetchCastByMovieId(movieId: 1)

        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertTrue(viewModel.cast!.isEmpty)
    }

    func testFetchSimilarMoviesFailure() async {
        let viewModel = MovieDetailViewModel(
            fetchMovieDetailUseCase: MockFetchMovieDetailUseCase(),
            fetchCastByMovieIdUseCase: MockFetchCastByMovieIdUseCase(),
            fetchSimilarMoviesUseCase: FailingFetchSimilarMoviesUseCase()
        )

        await viewModel.fetchSimilarMovies(movieId: 1)

        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertTrue(viewModel.similarMovies!.isEmpty)
    }
    
    func testLoadingStateDuringFetchMovieDetail() async {
        let viewModel = MovieDetailViewModel(
            fetchMovieDetailUseCase: MockFetchMovieDetailUseCaseWithDelay(delay: 0.5),
            fetchCastByMovieIdUseCase: MockFetchCastByMovieIdUseCase(),
            fetchSimilarMoviesUseCase: MockFetchSimilarMoviesUseCase()
        )

        let expectation = XCTestExpectation(description: "Loading state updated to true")

        var cancellables = Set<AnyCancellable>()
        viewModel.$isLoading
            .dropFirst()
            .sink { isLoading in
                if isLoading == true {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        Task {
            await viewModel.fetchMovieDetail(movieId: 1)
        }

        await fulfillment(of: [expectation], timeout: 1)

        XCTAssertTrue(viewModel.isLoading)

        // Esperá a que termine la tarea
        try? await Task.sleep(nanoseconds: 600_000_000) // 0.6 sec

        XCTAssertFalse(viewModel.isLoading)
    }
}
