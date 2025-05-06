//
//  SeriesDetailView.swift
//  ModoCine
//
//  Created by Fernando Moreno on 05/05/2025.
//

import SwiftUI

struct SeriesDetailView: View {
    let serieId: Int
    @ObservedObject var viewModel: SeriesDetailViewModel
    @State private var selectedSeason: Season?
    @State private var selectedActorId: ActorID? = nil

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let error = viewModel.errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            } else if let serieDetail = viewModel.serieDetail, let cast = viewModel.cast {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        // Imagen de fondo
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(serieDetail.backdrop_path)")) { image in
                            image.resizable().scaledToFill()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(height: 220)
                        .clipped()

                        // Poster + título
                        HStack(alignment: .top) {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(serieDetail.poster_path)")) { image in
                                image.resizable()
                                    .frame(width: 100, height: 150)
                                    .cornerRadius(8)
                            } placeholder: {
                                Color.gray
                                    .frame(width: 100, height: 150)
                                    .cornerRadius(8)
                            }

                            VStack(alignment: .leading, spacing: 8) {
                                Text(serieDetail.name).font(.title).bold()
                                Text(serieDetail.tagline)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal)
                        
                        Text("Información general")
                            .font(.title2)
                            .padding(.horizontal)

                        // Info
                        Group {
                            InfoRow(title: "Primera emisión", value: formattedReleaseDate(from: serieDetail.first_air_date))
                            if serieDetail.last_air_date != nil || serieDetail.last_air_date != "" {
                                InfoRow(title: "Última emisión", value: formattedReleaseDate(from: serieDetail.last_air_date))
                            }
                            
                            InfoRow(title: "En producción", value: serieDetail.in_production ? "Sí" : "No")
                            InfoRow(title: "Episodios", value: "\(serieDetail.number_of_episodes)")
                            InfoRow(title: "Temporadas", value: "\(serieDetail.number_of_seasons)")
                            InfoRow(title: "Idioma original", value: languageTransform(serieDetail.original_language))
                            InfoRow(title: "Estado", value: serieDetail.statusDescription)
                            InfoRow(title: "Puntuación", value: "\(serieDetail.vote_average) (\(serieDetail.vote_count) votos)")
                        }
                        .padding(.horizontal)
                        
                        Divider()

                        // Sinopsis
                        Text("Sinopsis")
                            .font(.title2)
                            .padding(.horizontal)
                        Text(serieDetail.overview)
                            .padding(.horizontal)
                        
                        Text("🎭 Actores")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        if !cast.isEmpty {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(cast, id: \.order) { actor in
                                        PosterActorView(imagePath: actor.profilePath, name: actor.name, characterName: actor.character, onClick: { selectedActorId = ActorID(id: actor.id) })
                                            .padding(.horizontal)
                                    }
                                }
                                .padding(.top)
                            }
                        } else {
                            Text("No hay actores disponibles")
                                .padding(.horizontal)
                        }

                        // Picker de temporada
                        if !serieDetail.seasons.isEmpty {
                            Picker("Temporada", selection: $selectedSeason) {
                                ForEach(serieDetail.seasons, id: \.id) { season in
                                    Text("Temporada \(season.season_number)")
                                        .tag(Optional(season))
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding(.horizontal)
                            .onChange(of: selectedSeason) { oldSeason, newSeason in
                                if let season = newSeason {
                                    Task {
                                        await viewModel.fetchSeasons(id: serieId, season: season.season_number)
                                    }
                                }
                            }

                            if let season = selectedSeason,
                               let seasonDetail = viewModel.seasons {
                                Divider().padding(.horizontal)
                                Text("Episodios de Temporada \(season.season_number)")
                                    .font(.headline)
                                    .padding(.horizontal)

                                ForEach(seasonDetail.episodes ?? [], id: \.id) { episode in
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(episode.name ?? "Sin título")
                                            .font(.subheadline)
                                        Text(episode.overview ?? "")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            Task {
                await viewModel.fetchSeriesDetail(id: serieId)
                await viewModel.fetchCastByMovieId(id: serieId)
                if let firstSeason = viewModel.serieDetail?.seasons.first {
                    selectedSeason = firstSeason
                    await viewModel.fetchSeasons(id: serieId, season: 1)
                }
            }
        }
    }
}

struct InfoRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title + ":")
                .bold()
            Spacer()
            Text(value)
        }
    }
}
