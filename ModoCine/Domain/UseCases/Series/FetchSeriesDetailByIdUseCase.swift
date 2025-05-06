//
//  FetchSeriesDetailByIdUseCase.swift
//  ModoCine
//
//  Created by Fernando Moreno on 05/05/2025.
//

protocol FetchSeriesDetailByIdUseCase {
    func execute(id: Int) async throws -> SeriesDetail
}
