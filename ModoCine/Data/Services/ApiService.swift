//
//  ApiService.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

protocol ApiService {
    func getPopularMovies() async throws -> [MovieDTO]
    func getTopRatedMovies() async throws -> [MovieDTO]
    func getUpcomingMovies() async throws -> [MovieDTO]
    func getSimilarMovies(movieId: Int) async throws -> [MovieDTO]
    func getMovieDetail(movieId: Int) async throws -> MovieDetailDTO
    func getMovieByName(name: String) async throws -> [MovieDTO]
    func getActorsByIdMovie(id: Int) async throws -> [ActorDTO]
    func getActorById(id: Int) async throws -> DetailActorDTO
    func getExternalIds(id: Int) async throws -> ExternalIdsActorDTO
    func getCastByActorId(id: Int) async throws -> [CastCreditsByActorDTO]
    func getSeriesByName(name: String) async throws -> [SeriesDTO]
    func getDetailSeriesById(id: Int) async throws -> SeriesDetailDTO
    func getSeasonBySeriesId(id: Int, season: Int) async throws -> SeriesSeasonDTO
    func getActorsByIdSeries(id: Int) async throws -> [ActorDTO]
}
