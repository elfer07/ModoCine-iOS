//
//  Movie.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

import Foundation

struct Movie: Decodable, Identifiable {
    var id: Int?
    var backdropPath: String?
    var originalTitle: String?
    var originalLanguage: String?
    var popularity: Double?
    var posterPath: String?
    var title: String?
    var voteAverage: Double?
    var voteCount: Int?
    var overview: String?
    var releaseDate: String?
}
