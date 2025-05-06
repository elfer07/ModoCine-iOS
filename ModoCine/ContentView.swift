//
//  ContentView.swift
//  ModoCine
//
//  Created by Fernando Moreno on 31/03/2025.
//

import SwiftUI
import AppTrackingTransparency

struct ContentView: View {
    @StateObject private var navigationManager: NavigationManager
    @StateObject private var viewModel: HomeViewModel
    @StateObject private var detailViewModel: MovieDetailViewModel
    @StateObject private var seriesDetailViewModel: SeriesDetailViewModel
    @StateObject private var searchViewModel: SearchViewModel
    @StateObject private var searchSeriesViewModel: SearchSeriesViewModel
    @StateObject private var actorDetailViewModel: ActorDetailViewModel
    init(navigationManager: NavigationManager, viewModel: HomeViewModel, detailViewModel: MovieDetailViewModel, seriesDetailViewModel: SeriesDetailViewModel, searchViewModel: SearchViewModel, searchSeriesViewModel: SearchSeriesViewModel, actorDetailViewModel: ActorDetailViewModel) {
        _navigationManager = StateObject(wrappedValue: navigationManager)
        _viewModel = StateObject(wrappedValue: viewModel)
        _detailViewModel = StateObject(wrappedValue: detailViewModel)
        _seriesDetailViewModel = StateObject(wrappedValue: seriesDetailViewModel)
        _searchViewModel = StateObject(wrappedValue: searchViewModel)
        _searchSeriesViewModel = StateObject(wrappedValue: searchSeriesViewModel)
        _actorDetailViewModel = StateObject(wrappedValue: actorDetailViewModel)
    }
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            VStack {
                HomeView(viewModel: viewModel)
            }
            .navigationDestination(for: Route.self, destination: { route in
                switch route {
                case .movieDetail(let movieId):
                    MovieDetailView(movieId: movieId, viewModel: detailViewModel, actorViewModel: actorDetailViewModel)
                        .environmentObject(navigationManager)
                case .home:
                    HomeView(viewModel: viewModel)
                case .search:
                    SearchMovieView(viewModel: searchViewModel)
                case .series:
                    SeriesView(viewModel: searchSeriesViewModel)
                case .seriesDetails(let serieId):
                    SeriesDetailView(serieId: serieId, viewModel: seriesDetailViewModel)
                }
            })
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                    print(status)
                })
            }
        }
        .preferredColorScheme(.dark)
        .environmentObject(navigationManager)
    }
}
