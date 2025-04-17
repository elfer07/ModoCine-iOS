//
//  DetailActor.swift
//  ModoCine
//
//  Created by Fernando Moreno on 14/04/2025.
//

struct DetailActorDTO: Decodable {
    let also_known_as: [String]
    let biography: String
    let birthday: String?
    let deathday: String?
    let gender: Int
    let homepage: String
    let id: Int
    let imdb_id: String
    let known_for_department: String
    let name: String
    let place_of_birth: String
    let popularity: Double
    let profile_path: String
    
    func toDomain() -> DetailActor {
        return DetailActor(
            alsoKnownAs: also_known_as,
            biography: biography,
            birthday: birthday,
            deathday: deathday,
            gender: gender,
            homepage: homepage,
            id: id,
            imdbId: imdb_id,
            knownForDepartment: known_for_department,
            name: name,
            placeOfBirth: place_of_birth,
            popularity: popularity,
            profilePath: profile_path
        )
    }
}

struct ExternalIdsActorDTO: Decodable {
    let id: Int
    let freebase_mid: String
    let freebase_id: String
    let imdb_id: String
    let tvrage_id: Int
    let facebook_id: String
    let instagram_id: String
    let twitter_id: String
    
    func toDomain() -> ExternalIdsActor {
        return ExternalIdsActor(
            id: id,
            freebaseMid: freebase_mid,
            freebaseId: freebase_id,
            imdbId: imdb_id,
            tvrageId: tvrage_id,
            facebookId: facebook_id,
            instagramId: instagram_id,
            twitterId: twitter_id
        )
    }
}

struct CastCreditsByActorDTO: Decodable {
    let backdrop_path: String
    let original_title: String
    let poster_path: String
    let title: String
    let character: String
    let credit_id: String
    let media_type: String
    
    func toDomain() -> CastCreditsByActor {
        return CastCreditsByActor(
            backdropPath: backdrop_path,
            originalTitle: original_title,
            posterPath: poster_path,
            title: title,
            character: character,
            creditId: credit_id,
            mediaType: media_type
        )
    }
}

struct ListCastByActorDTO: Decodable {
    let cast: [CastCreditsByActorDTO]
}
