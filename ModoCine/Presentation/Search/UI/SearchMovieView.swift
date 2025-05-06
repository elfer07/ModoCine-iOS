//
//  SearchMovieView.swift
//  ModoCine
//
//  Created by Fernando Moreno on 17/04/2025.
//

import SwiftUI

struct SearchMovieView: View {
    @ObservedObject var viewModel: SearchViewModel
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var query: String = ""

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack {
            // Buscador
            TextField("Buscar películas...", text: $query, onCommit: {
                searchMovies()
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
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.results, id: \.id) { movie in
                        MovieGridItemView(posterPath: movie.posterPath, onClick: {
                            if let movieId = movie.id {
                                navigationManager.navigate(to: .movieDetail(movieId))
                            }
                        })
                    }
                }
                .padding()
            }
        }
    }
    
    // Simulación de búsqueda (reemplazalo por tu lógica real)
    func searchMovies() {
        Task {
            await viewModel.loadMoviesByName(name: query)
        }
    }
}

#Preview {
    //SearchMovieView()
}
