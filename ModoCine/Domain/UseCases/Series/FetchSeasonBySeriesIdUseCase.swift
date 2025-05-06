//
//  FetchSeasonBySeriesIdUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 05/05/2025.
//

protocol FetchSeasonBySeriesIdUseCase {
    func execute(id: Int, season: Int) async throws -> SeriesSeason
}
