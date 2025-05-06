//
//  MovieRepositoryImpl.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

class MovieRepositoryImpl: MovieRepository {
    
    private let apiService: ApiService

    init(apiService: ApiService = ApiServiceImpl()) {
        self.apiService = apiService
    }
    
    func fetchUpcomingMovies() async throws -> [Movie] {
        let movies = try await apiService.getUpcomingMovies()
        return movies.map { $0.toDomain() }
    }
    
    func fetchTopRatedMovies() async throws -> [Movie] {
        let movies = try await apiService.getTopRatedMovies()
        return movies.map { $0.toDomain() }
    }

    func fetchPopularMovies() async throws -> [Movie] {
        let movies = try await apiService.getPopularMovies()
        return movies.map { $0.toDomain() }
    }
    
    func fetchSimilarMovies(movieId: Int) async throws -> [Movie] {
        let similarMovies = try await apiService.getSimilarMovies(movieId: movieId)
        return similarMovies.map { $0.toDomain() }
    }
    
    func fetchMovieDetail(movieId: Int) async throws -> MovieDetail {
        let movieDetail = try await apiService.getMovieDetail(movieId: movieId)
        return movieDetail.toDomain()
    }
    
    func fetchMoviesByName(name: String) async throws -> [Movie] {
        let movies = try await apiService.getMovieByName(name: name)
        return movies.map { $0.toDomain() }
    }
    
    func fetchActorsByMovieId(movieId: Int) async throws -> [Actor] {
        let actorsDto = try await apiService.getActorsByIdMovie(id: movieId)
        return actorsDto.map { $0.toDomain() }
    }
    
    func fetchActorsByIdSeries(id: Int) async throws -> [Actor] {
        let actorsDto = try await apiService.getActorsByIdSeries(id: id)
        return actorsDto.map { $0.toDomain() }
    }
    
    func fetchActorById(actorId: Int) async throws -> DetailActor {
        let actorDetailDto = try await apiService.getActorById(id: actorId)
        return actorDetailDto.toDomain()
    }
    
    func fetchExternalIds(actorId: Int) async throws -> ExternalIdsActor {
        let externalIdsDto = try await apiService.getExternalIds(id: actorId)
        return externalIdsDto.toDomain()
    }
    
    func fetchCastByActorId(actorId: Int) async throws -> [CastCreditsByActor] {
        let castDto = try await apiService.getCastByActorId(id: actorId)
        print("cantidad de pelis: \(castDto.count)")
        return castDto.map { $0.toDomain() }
    }
    
    func fetchSeriesByName(name: String) async throws -> [Series] {
        let seriesDto = try await apiService.getSeriesByName(name: name)
        print("cantidad de series: \(seriesDto.count)")
        return seriesDto.map { $0.toDomain() }
    }
    
    func fetchSeriesDetailById(id: Int) async throws -> SeriesDetail {
        let seriesDetailDto = try await apiService.getDetailSeriesById(id: id)
        print("detail series: \(seriesDetailDto)")
        return seriesDetailDto.toDomain()
    }
    
    func fetchSeasonBySeriesId(id: Int, season: Int) async throws -> SeriesSeason {
        let seriesSeason = try await apiService.getSeasonBySeriesId(id: id, season: season)
        return seriesSeason.toDomain()
    }
}
