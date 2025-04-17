//
//  ModoCineApp.swift
//  ModoCine
//
//  Created by Fernando Moreno on 31/03/2025.
//

import SwiftUI

@main
struct ModoCineApp: App {
    var body: some Scene {
        WindowGroup {
            let navigationManager = NavigationManager()
            let apiService = ApiServiceImpl()
            let movieRepository = MovieRepositoryImpl(apiService: apiService)
            let popularUseCase = FetchPopularMoviesUseCaseImpl(movieRepository: movieRepository)
            let topRatedUseCase = FetchTopRatedMoviesUseCaseImpl(movieRepository: movieRepository)
            let upcomingUseCase = FetchUpcomingMoviesUseCaseImpl(movieRepository: movieRepository)
            let similarMoviesUseCase = FetchSimilarMoviesUseCaseImpl(movieRepository: movieRepository)
            let movieDetailUseCase = FetchMovieDetailUseCaseImpl(movieRepository: movieRepository)
            let castMovieDetailUseCase = FetchCastByMovieIdUseCaseImpl(movieRepository: movieRepository)
            let homeViewModel = HomeViewModel(
                fetchPopularMoviesUseCase: popularUseCase,
                fetchTopRatedMoviesUseCase: topRatedUseCase,
                fetchUpcomingMoviesUseCase: upcomingUseCase
            )
            let detailViewModel = MovieDetailViewModel(
                fetchMovieDetailUseCase: movieDetailUseCase,
                fetchCastByMovieIdUseCase: castMovieDetailUseCase,
                fetchSimilarMoviesUseCase: similarMoviesUseCase
            )

            ContentView(navigationManager: navigationManager, viewModel: homeViewModel, detailViewModel: detailViewModel)
        }
    }
}
