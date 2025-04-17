//
//  HomeViewModelTests.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

import XCTest
@testable import ModoCine

@MainActor
final class HomeViewModelTests: XCTestCase {
    let mockRepo = MockMovieRepository()

    func testLoadMovies_LoadsAllMovies() async {
        
        mockRepo.popularMoviesToReturn = [.mock(id: 1)]
        mockRepo.topRatedMoviesToReturn = [.mock(id: 2)]
        mockRepo.upcomingMoviesToReturn = [.mock(id: 3)]

        let viewModel = HomeViewModel(
            fetchPopularMoviesUseCase: FetchPopularMoviesUseCaseImpl(movieRepository: mockRepo),
            fetchTopRatedMoviesUseCase: FetchTopRatedMoviesUseCaseImpl(movieRepository: mockRepo),
            fetchUpcomingMoviesUseCase: FetchUpcomingMoviesUseCaseImpl(movieRepository: mockRepo)
        )

        await viewModel.loadMovies()

        XCTAssertEqual(viewModel.popularMovies.first?.id, 1)
        XCTAssertEqual(viewModel.topRatedMovies.first?.id, 2)
        XCTAssertEqual(viewModel.upcomingMovies.first?.id, 3)
    }
    
    func testLoadPopularMoviesFailure() async {
        let viewModel = HomeViewModel(
            fetchPopularMoviesUseCase: FailingPopularMoviesUseCase(),
            fetchTopRatedMoviesUseCase: FetchTopRatedMoviesUseCaseImpl(movieRepository: mockRepo),
            fetchUpcomingMoviesUseCase: FetchUpcomingMoviesUseCaseImpl(movieRepository: mockRepo)
        )

        await viewModel.loadMovies()

        XCTAssertNotNil(viewModel.error)
        XCTAssertTrue(viewModel.popularMovies.isEmpty)
    }

    func testLoadTopRatedMoviesFailure() async {
        let viewModel = HomeViewModel(
            fetchPopularMoviesUseCase: FetchPopularMoviesUseCaseImpl(movieRepository: mockRepo),
            fetchTopRatedMoviesUseCase: FailingTopRatedMoviesUseCase(),
            fetchUpcomingMoviesUseCase: FetchUpcomingMoviesUseCaseImpl(movieRepository: mockRepo)
        )

        await viewModel.loadMovies()

        XCTAssertNotNil(viewModel.error)
        XCTAssertTrue(viewModel.topRatedMovies.isEmpty)
    }

    func testLoadUpcomingMoviesFailure() async {
        let viewModel = HomeViewModel(
            fetchPopularMoviesUseCase: FetchPopularMoviesUseCaseImpl(movieRepository: mockRepo),
            fetchTopRatedMoviesUseCase: FetchTopRatedMoviesUseCaseImpl(movieRepository: mockRepo),
            fetchUpcomingMoviesUseCase: FailingUpcomingMoviesUseCase()
        )

        await viewModel.loadMovies()

        XCTAssertNotNil(viewModel.error)
        XCTAssertTrue(viewModel.upcomingMovies.isEmpty)
    }
}
