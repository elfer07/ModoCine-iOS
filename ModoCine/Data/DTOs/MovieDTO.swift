//
//  MovieDTO.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

struct MovieDTO: Decodable {
    let id: Int?
    let backdrop_path: String?
    let original_title: String?
    let original_language: String?
    let popularity: Double?
    let poster_path: String?
    let title: String?
    let vote_average: Double?
    let vote_count: Int?
    let overview: String?
    let release_date: String?

    func toDomain() -> Movie {
        return Movie(
            id: id,
            backdropPath: backdrop_path,
            originalTitle: original_title,
            originalLanguage: original_language,
            popularity: popularity,
            posterPath: poster_path,
            title: title,
            voteAverage: vote_average,
            voteCount: vote_count,
            overview: overview,
            releaseDate: release_date,
        )
    }
}
