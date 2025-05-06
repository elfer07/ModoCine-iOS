//
//  SearchViewModel.swift
//  ModoCine
//
//  Created by Fernando Moreno on 17/04/2025.
//

import Foundation

@MainActor
class SearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var isLoading: Bool = false
    @Published var error: String?
    @Published var results: [Movie] = []
    
    private let fetchMoviesByNameUseCase: FetchMoviesByNameUseCase
    
    init(fetchMoviesByNameUseCase: FetchMoviesByNameUseCase) {
        self.fetchMoviesByNameUseCase = fetchMoviesByNameUseCase
    }
    
    func loadMoviesByName(name: String) async {
        isLoading = true
        error = nil
        do {
            results = try await fetchMoviesByNameUseCase.execute(name: name)
        } catch {
            self.error = error.localizedDescription
        }
        isLoading = false
    }
    
}
