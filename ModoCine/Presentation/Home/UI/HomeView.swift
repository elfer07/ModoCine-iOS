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
    
    @State private var cards: [Card] = []
    @State private var activeCard: Card? = nil
        
    var body: some View {
        ZStack {
            AmbientBackground()
                .animation(.easeInOut(duration: 1), value: activeCard)
            ScrollView {
                
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
                    } else if !cards.isEmpty {
                        IntroPageMovies(cards: cards, activeCard: $activeCard, onClick: { id in
                            navigationManager.navigate(to: .movieDetail(id))
                        }, onNavigateToSearch: {
                            navigationManager.navigate(to: .search)
                        }, onNavigateToSearchTv: { navigationManager.navigate(to: .series) })
                        
                        Text("Películas Populares")
                            .font(.title)
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
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.loadMovies()
                
                cards = viewModel.upcomingMovies.compactMap {
                    guard let id = $0.id, let posterPath = $0.posterPath else { return nil }
                    return Card(id: id,image: "https://image.tmdb.org/t/p/w500\(posterPath)")
                }
            }
        }
    }
    
    @ViewBuilder
    private func AmbientBackground() -> some View {
        GeometryReader {
            let size = $0.size
            
            ZStack {
                ForEach(cards) { card in
                    // you can use downsized image for this, but for the video tutorial purpose, i am going yo use the actual image
                    AsyncImage(url: URL(string: card.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .ignoresSafeArea()
                            .frame(width: size.width, height: size.height)
                            // only showing active card image
                            .opacity(activeCard?.id == card.id ? 1 : 0)
                    } placeholder: {
                        Color.black
                    }
                }
                
                Rectangle()
                    .fill(.black.opacity(0.45))
                    .ignoresSafeArea()
            }
            .compositingGroup()
            .blur(radius: 90, opaque: true)
            .ignoresSafeArea()
        }
    }
}
