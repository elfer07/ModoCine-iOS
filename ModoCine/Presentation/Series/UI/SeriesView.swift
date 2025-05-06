//
//  SeriesView.swift
//  ModoCine
//
//  Created by Fernando Moreno on 05/05/2025.
//

import SwiftUI

struct SeriesView: View {
    @ObservedObject var viewModel: SearchSeriesViewModel
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var query: String = ""
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack {
            // Buscador
            TextField("Buscar series...", text: $query, onCommit: {
                searchSeries()
            })
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top)

            // Indicador de carga
            if viewModel.isLoading {
                ProgressView("Buscando...")
                    .padding()
            }

            // Resultados
            if viewModel.results.isEmpty && !viewModel.isLoading {
                VStack {
                    Spacer()
                    Text("No hay resultados")
                        .font(.title)
                    Spacer()
                }
                .padding()
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.results, id: \.id) { serie in
                            MovieGridItemView(posterPath: serie.poster_path, onClick: {
                                navigationManager.navigate(to: .seriesDetails(serie.id))
                            })
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
    // Simulación de búsqueda (reemplazalo por tu lógica real)
    func searchSeries() {
        Task {
            await viewModel.loadSeriesByName(name: query)
        }
    }
}

