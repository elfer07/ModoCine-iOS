//
//  SeriesDetailViewModel.swift
//  ModoCine
//
//  Created by Fernando Moreno on 05/05/2025.
//

import Foundation

@MainActor
class SeriesDetailViewModel: ObservableObject {
    @Published var serieDetail: SeriesDetail?
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var seasons: SeriesSeason?
    @Published var cast: [Actor]?
    
    private let fetchSeriesDetailByIdUseCase: FetchSeriesDetailByIdUseCase
    private let fetchSeasonBySeriesIdUseCase: FetchSeasonBySeriesIdUseCase
    private let fetchCastBySeriesIdUseCase: FetchCastBySeriesIdUseCase
    
    init(fetchSeriesDetailByIdUseCase: FetchSeriesDetailByIdUseCase, fetchSeasonBySeriesIdUseCase: FetchSeasonBySeriesIdUseCase, fetchCastBySeriesIdUseCase: FetchCastBySeriesIdUseCase) {
        self.fetchSeriesDetailByIdUseCase = fetchSeriesDetailByIdUseCase
        self.fetchSeasonBySeriesIdUseCase = fetchSeasonBySeriesIdUseCase
        self.fetchCastBySeriesIdUseCase = fetchCastBySeriesIdUseCase
    }
    
    func fetchSeriesDetail(id: Int) async {
        isLoading = true
        errorMessage = nil
        
        do {
            serieDetail = try await fetchSeriesDetailByIdUseCase.execute(id: id)
        } catch {
            errorMessage = "Hubo un erroe al obtener el detalle de la serie"
            print("Error en fetchSeriesDetail: \(error.localizedDescription)")
        }
        isLoading = false
    }
    
    func fetchSeasons(id: Int, season: Int) async {
        isLoading = true
        errorMessage = nil
        
        do {
            seasons = try await fetchSeasonBySeriesIdUseCase.execute(id: id, season: season)
        } catch {
            errorMessage = "Hubo un error al obtener las temporadas"
            print("Error en fetchSeasons: \(error.localizedDescription)")
        }
        isLoading = false
    }
    
    func fetchCastByMovieId(id: Int) async {
        isLoading = true
        errorMessage = nil
        
        do {
            cast = try await fetchCastBySeriesIdUseCase.execute(id: id)
        } catch {
            cast = []
            errorMessage = "Error al obtener los datos del elenco de la película."
        }
        
        isLoading = false
    }
}
