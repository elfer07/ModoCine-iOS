//
//  MovieDetailViewModel.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

import Foundation

@MainActor
class MovieDetailViewModel: ObservableObject {
    @Published var movieDetail: MovieDetail?
    @Published var cast: [Actor]?
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var similarMovies: [Movie]?
    
    private let fetchMovieDetailUseCase: FetchMovieDetailUseCase
    private let fetchCastByMovieIdUseCase: FetchCastByMovieIdUseCase
    private let fetchSimilarMoviesUseCase: FetchSimilarMoviesUseCase
    
    init(
        fetchMovieDetailUseCase: FetchMovieDetailUseCase,
        fetchCastByMovieIdUseCase: FetchCastByMovieIdUseCase,
        fetchSimilarMoviesUseCase: FetchSimilarMoviesUseCase
    ) {
        self.fetchMovieDetailUseCase = fetchMovieDetailUseCase
        self.fetchCastByMovieIdUseCase = fetchCastByMovieIdUseCase
        self.fetchSimilarMoviesUseCase = fetchSimilarMoviesUseCase
    }
    
    func fetchMovieDetail(movieId: Int) async {
        isLoading = true
        errorMessage = nil
        
        do {
            movieDetail = try await fetchMovieDetailUseCase.execute(movieId: movieId)
            
        } catch {
            errorMessage = "Hubo un error al obtener el detalle de la película."
        }
        
        isLoading = false
    }
    
    func fetchCastByMovieId(movieId: Int) async {
        isLoading = true
        errorMessage = nil
        
        do {
            cast = try await fetchCastByMovieIdUseCase.execute(movieId: movieId)
        } catch {
            cast = []
            errorMessage = "Error al obtener los datos del elenco de la película."
        }
        
        isLoading = false
    }
    
    func fetchSimilarMovies(movieId: Int) async {
        isLoading = true
        errorMessage = nil
        
        do {
            similarMovies = try await fetchSimilarMoviesUseCase.execute(movieId: movieId)
        } catch {
            similarMovies = []
            errorMessage = "Error al obtener las películas similares."
        }
        isLoading = false
    }
}
