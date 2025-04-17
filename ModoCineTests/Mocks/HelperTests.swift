//
//  Helper.swift
//  ModoCine
//
//  Created by Fernando Moreno on 16/04/2025.
//

import XCTest
import Foundation
@testable import ModoCine

extension MovieDetailDTO {
    static func mock(
        id: Int = 1,
        title: String = "Mock Title",
        overview: String = "Mock overview",
        runtime: Int = 120,
        genres: [GenresDTO] = [GenresDTO(id: 1, name: "Action")]
    ) -> MovieDetailDTO {
        return MovieDetailDTO(
            backdrop_path: "/mockBackdrop.jpg",
            genres: genres,
            homepage: "https://mockhomepage.com",
            id: id,
            original_language: "es",
            original_title: "Mock Original Title",
            overview: overview,
            popularity: 9.0,
            poster_path: "/mockPoster.jpg",
            production_companies: [],
            production_countries: [],
            release_date: "2025-01-01",
            revenue: 1000000,
            runtime: runtime,
            status: "Released",
            tagline: "Mock tagline",
            title: title,
            video: false,
            vote_average: 8.5,
            vote_count: 500
        )
    }
}

extension GenresDTO {
    static func mock(id: Int = 1, name: String = "Terror") -> GenresDTO {
        return GenresDTO(id: id, name: name)
    }
}

extension MovieDTO {
    static func mock(
        id: Int = 1,
        title: String = "Mock Movie",
        overview: String = "Mock overview"
    ) -> MovieDTO {
        return MovieDTO(
            id: id,
            backdrop_path: "/mockBackdrop.jpg",
            original_title: title,
            original_language: "en",
            popularity: 8.7,
            poster_path: "/mockPoster.jpg",
            title: title,
            vote_average: 7.8,
            vote_count: 200,
            overview: overview,
            release_date: "2025-01-01"
        )
    }
}

extension ActorDTO {
    static func mock(id: Int = 101, name: String = "Mock Actor") -> ActorDTO {
        return ActorDTO(
            gender: 2,
            id: id,
            name: name,
            popularity: 10.0,
            profile_path: "/mockActor.jpg",
            character: "Hero",
            order: 1
        )
    }
}

extension CastDTO {
    static func mock(actors: [ActorDTO] = [ActorDTO.mock()]) -> CastDTO {
        return CastDTO(cast: actors)
    }
}

extension DetailActorDTO {
    static func mock(id: Int = 101, name: String = "Mock Actor") -> DetailActorDTO {
        return DetailActorDTO(
            also_known_as: ["Alias One", "Alias Two"],
            biography: "Mock biography",
            birthday: "1983-09-07",
            deathday: nil,
            gender: 2,
            homepage: "https://mockactor.com",
            id: id,
            imdb_id: "nm000101",
            known_for_department: "Acting",
            name: name,
            place_of_birth: "Mock City",
            popularity: 9.5,
            profile_path: "/mockActor.jpg"
        )
    }
}

extension ExternalIdsActorDTO {
    static func mock(id: Int = 1) -> ExternalIdsActorDTO {
        return ExternalIdsActorDTO(
            id: id,
            freebase_mid: "mid123",
            freebase_id: "id123",
            imdb_id: "imdb123",
            tvrage_id: 456,
            facebook_id: "mockFB",
            instagram_id: "mockIG",
            twitter_id: "mockTW"
        )
    }
}

extension CastCreditsByActorDTO {
    static func mock(id: Int = 1) -> CastCreditsByActorDTO {
        return CastCreditsByActorDTO(
            backdrop_path: "/backdrop.jpg",
            original_title: "Original Movie",
            poster_path: "/poster.jpg",
            title: "Mock Title",
            character: "Mock Character",
            credit_id: "credit123",
            media_type: "movie"
        )
    }
}

extension ListCastByActorDTO {
    static func mock(credits: [CastCreditsByActorDTO] = [CastCreditsByActorDTO.mock()]) -> ListCastByActorDTO {
        return ListCastByActorDTO(cast: credits)
    }
}

extension ProductionCompanyDTO {
    static func mock(id: Int = 1, name: String = "Mock Studio") -> ProductionCompanyDTO {
        return ProductionCompanyDTO(id: id, logo_path: "/mockLogo.jpg", name: name, origin_country: "AR")
    }
}

extension ProductionCountryDTO {
    static func mock(iso: String = "AR", name: String = "Argentina") -> ProductionCountryDTO {
        return ProductionCountryDTO(iso_3166_1: iso, name: name)
    }
}

extension ResultDTO {
    static func mock(movies: [MovieDTO] = [MovieDTO.mock()]) -> ResultDTO {
        return ResultDTO(results: movies)
    }
}

extension Actor {
    static func mock(
        id: Int = 101,
        name: String = "Mock Actor",
        character: String = "Mock Character"
    ) -> Actor {
        return Actor(
            gender: 2,
            id: id,
            name: name,
            popularity: 9.0,
            profilePath: "/mockProfile.jpg",
            character: character,
            order: 1
        )
    }
}

extension Cast {
    static func mock(cast: [Actor] = [Actor.mock()]) -> Cast {
        return Cast(cast: cast)
    }
}

extension DetailActor {
    static func mock(id: Int = 101, name: String = "Mock Actor") -> DetailActor {
        return DetailActor(
            alsoKnownAs: ["Mock Alias"],
            biography: "Mock biography",
            birthday: "1983-09-07",
            deathday: nil,
            gender: 2,
            homepage: "https://mockhomepage.com",
            id: id,
            imdbId: "nm000101",
            knownForDepartment: "Acting",
            name: name,
            placeOfBirth: "Mock City",
            popularity: 8.5,
            profilePath: "/mockProfile.jpg"
        )
    }
}

extension ExternalIdsActor {
    static func mock(id: Int = 1) -> ExternalIdsActor {
        return ExternalIdsActor(
            id: id,
            freebaseMid: "mid123",
            freebaseId: "id123",
            imdbId: "nm000123",
            tvrageId: 123,
            facebookId: "mockFB",
            instagramId: "mockIG",
            twitterId: "mockTW"
        )
    }
}

extension CastCreditsByActor {
    static func mock(id: Int = 1) -> CastCreditsByActor {
        return CastCreditsByActor(
            backdropPath: "/backdrop.jpg",
            originalTitle: "Mock Original Title",
            posterPath: "/poster.jpg",
            title: "Mock Title",
            character: "Mock Character",
            creditId: "credit123",
            mediaType: "movie"
        )
    }
}

extension ListCastByActor {
    static func mock(cast: [CastCreditsByActor] = [CastCreditsByActor.mock()]) -> ListCastByActor {
        return ListCastByActor(cast: cast)
    }
}

extension Genres {
    static func mock(id: Int = 1, name: String = "Action") -> Genres {
        return Genres(id: id, name: name)
    }
}

extension Movie {
    static func mock(
        id: Int = 1,
        title: String = "Mock Movie"
    ) -> Movie {
        return Movie(
            id: id,
            backdropPath: "/mockBackdrop.jpg",
            originalTitle: title,
            originalLanguage: "en",
            popularity: 8.5,
            posterPath: "/mockPoster.jpg",
            title: title,
            voteAverage: 7.5,
            voteCount: 400,
            overview: "Mock overview",
            releaseDate: "2025-01-01"
        )
    }
}

extension MovieDetail {
    static func mock(id: Int = 1, title: String = "Mock Movie") -> MovieDetail {
        return MovieDetail(
            backdropPath: "/mockBackdrop.jpg",
            genres: [Genres.mock()],
            homepage: "https://mockhomepage.com",
            id: id,
            originalLanguage: "en",
            originalTitle: title,
            overview: "Mock overview",
            popularity: 8.8,
            posterPath: "/mockPoster.jpg",
            productionCompanies: [ProductionCompany.mock()],
            productionCountries: [ProductionCountry.mock()],
            releaseDate: "2025-01-01",
            revenue: 1000000,
            runtime: 120,
            status: "Released",
            tagline: "Mock tagline",
            title: title,
            video: false,
            voteAverage: 8.5,
            voteCount: 400
        )
    }
}

extension ProductionCompany {
    static func mock(id: Int = 1, name: String = "Mock Studio") -> ProductionCompany {
        return ProductionCompany(
            id: id,
            logoPath: "/mockLogo.jpg",
            name: name,
            originCountry: "AR"
        )
    }
}

extension ProductionCountry {
    static func mock(iso: String = "AR", name: String = "Argentina") -> ProductionCountry {
        return ProductionCountry(
            iso31661: iso,
            name: name
        )
    }
}

extension Result {
    static func mock(movies: [Movie] = [Movie.mock()]) -> Result {
        return Result(results: movies)
    }
}
