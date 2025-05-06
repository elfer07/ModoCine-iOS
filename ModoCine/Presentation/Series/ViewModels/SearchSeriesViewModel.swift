//
//  SearchSeriesViewModel.swift
//  ModoCine
//
//  Created by Fernando Moreno on 05/05/2025.
//

import Foundation

@MainActor
class SearchSeriesViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var isLoading: Bool = false
    @Published var error: String?
    @Published var results: [Series] = []
    
    private let fetchSeriesByNameUseCase: FetchSeriesByNameUseCase
    
    init(fetchSeriesByNameUseCase: FetchSeriesByNameUseCase) {
        self.fetchSeriesByNameUseCase = fetchSeriesByNameUseCase
    }
    
    func loadSeriesByName(name: String) async {
        isLoading = true
        error = nil
        do {
            results = try await fetchSeriesByNameUseCase.execute(name: name)
        } catch {
            self.error = error.localizedDescription
        }
        isLoading = false
    }
}
