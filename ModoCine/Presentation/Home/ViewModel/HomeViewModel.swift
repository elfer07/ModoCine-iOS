//
//  HomeViewModel.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var popularMovies: [Movie] = []
    @Published var topRatedMovies: [Movie] = []
    @Published var upcomingMovies: [Movie] = []
    @Published var isLoading = false
    @Published var error: String?
    @Published var hasLoaded = false

    private let fetchPopularMoviesUseCase: FetchPopularMoviesUseCase
    private let fetchTopRatedMoviesUseCase: FetchTopRatedMoviesUseCase
    private let fetchUpcomingMoviesUseCase: FetchUpcomingMoviesUseCase

    init(fetchPopularMoviesUseCase: FetchPopularMoviesUseCase, fetchTopRatedMoviesUseCase: FetchTopRatedMoviesUseCase, fetchUpcomingMoviesUseCase: FetchUpcomingMoviesUseCase) {
        self.fetchPopularMoviesUseCase = fetchPopularMoviesUseCase
        self.fetchTopRatedMoviesUseCase = fetchTopRatedMoviesUseCase
        self.fetchUpcomingMoviesUseCase = fetchUpcomingMoviesUseCase
    }

    func loadMovies() async {
        isLoading = true
        error = nil
        do {
            popularMovies = try await fetchPopularMoviesUseCase.execute()
            topRatedMovies = try await fetchTopRatedMoviesUseCase.execute()
            upcomingMovies = try await fetchUpcomingMoviesUseCase.execute()
        } catch {
            self.error = error.localizedDescription
        }
        isLoading = false
    }
}
