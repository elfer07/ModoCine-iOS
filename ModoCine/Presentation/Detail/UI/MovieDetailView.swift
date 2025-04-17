//
//  MovieDetailView.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

import SwiftUI

struct MovieDetailView: View {
    let movieId: Int
    @ObservedObject var viewModel: MovieDetailViewModel

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let error = viewModel.errorMessage {
                VStack(alignment: .center) {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                }
            } else if let movie = viewModel.movieDetail, let cast = viewModel.cast, let similarMovies = viewModel.similarMovies {
                ScrollView {
                    ZStack(alignment: .top) {
                        AsyncImage(url: movie.backdropUrl) { phase in
                            switch phase {
                            case .empty:
                                Color.gray.opacity(0.3)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                            case .failure:
                                Color.gray
                            @unknown default:
                                Color.gray
                            }
                        }
                        .clipped()
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [.black.opacity(0.7), .clear]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )

                        VStack(spacing: 16) {
                            Text(movie.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top, 90)
                                .padding(.horizontal, 4)

                        }
                        .padding()
                    }

                    // POSTER Y DETALLE
                    HStack {
                        MoviePosterView(imageUrl: movie.posterUrl)
                            .padding(.trailing, 4)
                        VStack(alignment: .leading, spacing: 12) {
                            InfoMovieView(iconName: "star", title: "\(movie.voteAverage) (\(movie.voteCount) votos)")
                            InfoMovieView(iconName: "calendar", title: "Lanzamiento: \(formattedReleaseDate(from: movie.releaseDate))")
                            InfoMovieView(iconName: "globe", title: "Idioma Original: \(languageTransform(movie.originalLanguage))")
                            InfoMovieView(iconName: "clock", title: "Duración: \(movie.runtime) min")
                        }
                    }
                    .padding(.top, -60)

                    VStack(alignment: .leading, spacing: 16) {
                        // GÉNEROS
                        if !movie.genres.isEmpty {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(movie.genres, id: \.id) { genre in
                                        Text(genre.name)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 6)
                                            .background(Color.gray.opacity(0.2))
                                            .clipShape(Capsule())
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }

                        // RESUMEN
                        Text("Resumen")
                            .font(.headline)
                            .padding(.leading, 8)
                        Text(movie.overview)
                            .font(.body)
                            .padding(8)

                        // PLACEHOLDERS
                        Text("🎭 Actores")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        if !cast.isEmpty {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(cast, id: \.order) { actor in
                                        PosterActorView(imagePath: actor.profilePath, name: actor.name)
                                            .padding(.horizontal)
                                    }
                                }
                                .padding(.top)
                            }
                        } else {
                            Text("No hay actores disponibles")
                                .padding(.horizontal)
                        }

                        Text("🎬 Películas similares")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        if !similarMovies.isEmpty {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(similarMovies, id: \.id) { movie in
                                        MovieItemCardView(posterPath: movie.posterPath, onClick: {})
                                            .padding(.horizontal)
                                    }
                                }
                            }
                        } else {
                            Text("No hay películas similares")
                        }
                    }
                    .padding(.top)
                }
            } else {
                Text("No hay detalle de película")
            }
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            Task {
                await viewModel.fetchMovieDetail(movieId: movieId)
                await viewModel.fetchCastByMovieId(movieId: movieId)
                await viewModel.fetchSimilarMovies(movieId: movieId)
            }
        }
    }
}
