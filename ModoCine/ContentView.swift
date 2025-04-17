//
//  ContentView.swift
//  ModoCine
//
//  Created by Fernando Moreno on 31/03/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigationManager: NavigationManager
    @StateObject private var viewModel: HomeViewModel
    @StateObject private var detailViewModel: MovieDetailViewModel
    init(navigationManager: NavigationManager, viewModel: HomeViewModel, detailViewModel: MovieDetailViewModel) {
        _navigationManager = StateObject(wrappedValue: navigationManager)
        _viewModel = StateObject(wrappedValue: viewModel)
        _detailViewModel = StateObject(wrappedValue: detailViewModel)
    }
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            VStack {
                HomeView(viewModel: viewModel)
            }
            .navigationTitle(Text("ModoCine"))
            .navigationDestination(for: Route.self, destination: { route in
                switch route {
                case .movieDetail(let movieId):
                    MovieDetailView(movieId: movieId, viewModel: detailViewModel)
                        .environmentObject(navigationManager)
                case .home:
                    HomeView(viewModel: viewModel)
                }
            })
        }
        .preferredColorScheme(.dark)
        .environmentObject(navigationManager)
    }
}
