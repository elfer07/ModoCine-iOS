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
            let serieDetailUseCase = FetchSeriesDetailByIdUseCaseImpl(movieRepository: movieRepository)
            let castMovieDetailUseCase = FetchCastByMovieIdUseCaseImpl(movieRepository: movieRepository)
            let castSerieDetailUseCase = FetchCastBySeriesIdUseCaseImpl(movieRepository: movieRepository)
            let moviesByName = FetchMoviesByNameUseCaseImpl(movieRepository: movieRepository)
            let seriesByName = FetchSeriesByNameUseCaseImpl(movieRepository: movieRepository)
            let seasonsBySeriesId = FetchSeasonBySeriesIdUseCaseImpl(movieRepository: movieRepository)
            let actorById = FetchActorByIdUseCaseImpl(movieRepository: movieRepository)
            let externalIds = FetchExternalIdsUseCaseImpl(movieRepository: movieRepository)
            let castCreditByActor = FetchCastActorByIdUseCaseImpl(movieRepository: movieRepository)
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
            let serieDetailViewModel = SeriesDetailViewModel(
                fetchSeriesDetailByIdUseCase: serieDetailUseCase,
                fetchSeasonBySeriesIdUseCase: seasonsBySeriesId,
                fetchCastBySeriesIdUseCase: castSerieDetailUseCase
            )
            let searchViewModel = SearchViewModel(fetchMoviesByNameUseCase: moviesByName)
            let searchSeriesViewModel = SearchSeriesViewModel(fetchSeriesByNameUseCase: seriesByName)
            let actorDetailViewModel = ActorDetailViewModel(fetchActorByIdUseCase: actorById, fetchExternalIdsUseCase: externalIds, fetchCastActorByIdUseCase: castCreditByActor)

            ContentView(navigationManager: navigationManager, viewModel: homeViewModel, detailViewModel: detailViewModel, seriesDetailViewModel: serieDetailViewModel, searchViewModel: searchViewModel, searchSeriesViewModel: searchSeriesViewModel, actorDetailViewModel: actorDetailViewModel)
                .ignoresSafeArea()
        }
    }
}
