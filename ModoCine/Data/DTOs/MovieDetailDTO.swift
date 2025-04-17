//
//  MovieDetailDTO.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

struct MovieDetailDTO: Decodable {
    let backdrop_path: String
    let genres: [GenresDTO]
    let homepage: String
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let production_companies: [ProductionCompanyDTO]
    let production_countries: [ProductionCountryDTO]
    let release_date: String
    let revenue: Int64
    let runtime: Int
    let status: String
    let tagline: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
    
    func toDomain() -> MovieDetail {
        return MovieDetail(
            backdropPath: backdrop_path,
            genres: genres.map { $0.toDomain() },
            homepage: homepage,
            id: id,
            originalLanguage: original_language,
            originalTitle: original_title,
            overview: overview,
            popularity: popularity,
            posterPath: poster_path,
            productionCompanies: production_companies.map { $0.toDomain() },
            productionCountries: production_countries.map { $0.toDomain() },
            releaseDate: release_date,
            revenue: revenue,
            runtime: runtime,
            status: status,
            tagline: tagline,
            title: title,
            video: video,
            voteAverage: vote_average,
            voteCount: vote_count
        )
    }
}
