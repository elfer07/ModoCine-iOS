//
//  HomeView.swift
//  ModoCine
//
//  Created by Fernando Moreno on 31/03/2025.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @EnvironmentObject var navigationManager: NavigationManager
        
    var body: some View {
        VStack(alignment: .leading) {
            if viewModel.isLoading {
                ProgressView("Cargando películas...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let error = viewModel.error {
                VStack(alignment: .center) {
                    Text("Hubo un error al cargar las películas...")
                        .font(.headline)
                    Text(error)
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
                .multilineTextAlignment(.center)
                .padding()
            } else {
                Text("Películas Populares")
                    .font(.title)
                    .padding(.top)
                    .padding(.leading)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 12) {
                        ForEach(viewModel.popularMovies, id: \.id) { movie in
                            MovieItemCardView(posterPath: movie.posterPath, onClick: { navigationManager.navigate(to: .movieDetail(movie.id ?? 0)) })
                                .padding(.horizontal)
                        }
                    }
                }
                
                Text("Películas Mejores Valoradas")
                    .font(.title)
                    .padding(.top)
                    .padding(.leading)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 12) {
                        ForEach(viewModel.topRatedMovies, id: \.id) { movie in
                            MovieItemCardView(posterPath: movie.posterPath, onClick: { navigationManager.navigate(to: .movieDetail(movie.id ?? 0)) })
                                .padding(.horizontal)
                        }
                    }
                }
                
                Text("Próximas Películas")
                    .font(.title)
                    .padding(.top)
                    .padding(.leading)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 12) {
                        ForEach(viewModel.upcomingMovies, id: \.id) { movie in
                            MovieItemCardView(posterPath: movie.posterPath, onClick: { navigationManager.navigate(to: .movieDetail(movie.id ?? 0)) })
                                .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                    .padding(.leading)
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.loadMovies()
            }
        }
    }
}
