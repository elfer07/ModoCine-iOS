//
//  MovieDetail.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

import Foundation

struct MovieDetail: Decodable {
    var backdropPath: String
    var genres: [Genres]
    var homepage: String
    var id: Int
    var originalLanguage: String
    var originalTitle: String
    var overview: String
    var popularity: Double
    var posterPath: String
    var productionCompanies: [ProductionCompany]
    var productionCountries: [ProductionCountry]
    var releaseDate: String
    var revenue: Int64
    var runtime: Int
    var status: String
    var tagline: String
    var title: String
    var video: Bool
    var voteAverage: Double
    var voteCount: Int
    
    var posterUrl: URL? {
        URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
    
    var backdropUrl: URL? {
        URL(string: "https://image.tmdb.org/t/p/w780\(backdropPath)")
    }
}
