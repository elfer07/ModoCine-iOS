//
//  DetailActor.swift
//  ModoCine
//
//  Created by Fernando Moreno on 14/04/2025.
//

struct DetailActor: Decodable {
    let alsoKnownAs: [String]
    let biography: String
    let birthday: String?
    let deathday: String?
    let gender: Int
    let homepage: String?
    let id: Int
    let imdbId: String
    let knownForDepartment: String
    let name: String
    let placeOfBirth: String
    let popularity: Double
    let profilePath: String
}

struct ExternalIdsActor: Decodable {
    let id: Int
    let freebaseMid: String
    let freebaseId: String
    let imdbId: String
    let tvrageId: Int
    let facebookId: String
    let instagramId: String
    let twitterId: String
}

struct CastCreditsByActor: Decodable {
    let posterPath: String?
    let title: String
    let creditId: String
    let mediaType: String
}

struct ListCastByActor: Decodable {
    let cast: [CastCreditsByActor]?
}
