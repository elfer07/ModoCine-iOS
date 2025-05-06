//
//  SeriesDTO.swift
//  ModoCine
//
//  Created by Fernando Moreno on 05/05/2025.
//

struct SeriesDTO: Decodable {
    let id: Int
    let backdrop_path: String?
    let name: String?
    let poster_path: String?
    
    func toDomain() -> Series {
        return Series(
            id: id,
            backdrop_path: backdrop_path ?? "",
            name: name ?? "",
            poster_path: poster_path ?? ""
        )
    }
}

struct SeriesResultDTO: Decodable {
    let results: [SeriesDTO]?
}

struct SeriesDetailDTO: Decodable {
    let backdrop_path: String?
    let created_by: [CreatedByItemDTO]?
    let first_air_date: String?
    let genres: [GenresDTO]?
    let homepage: String?
    let id: Int
    let in_production: Bool?
    let last_air_date: String?
    let last_episode_to_air: LastEpisodeToAirDTO?
    let name: String?
    let next_episode_to_air: NextEpisodeToAirDTO?
    let networks: [NetworkDTO]?
    let number_of_episodes: Int?
    let number_of_seasons: Int?
    let original_language: String?
    let original_name: String?
    let overview: String?
    let popularity: Double?
    let poster_path: String?
    let seasons: [SeasonDTO]?
    let status: String?
    let tagline: String?
    let vote_average: Double?
    let vote_count: Int?
    
    func toDomain() -> SeriesDetail {
        return SeriesDetail(
            backdrop_path: backdrop_path ?? "",
            created_by: created_by?.map { $0.toDomain() } ?? [],
            first_air_date: first_air_date ?? "",
            genres: genres?.map { $0.toDomain() } ?? [],
            homepage: homepage ?? "",
            id: id,
            in_production: in_production ?? false,
            last_air_date: last_air_date ?? "",
            last_episode_to_air: last_episode_to_air?.toDomain() ?? .empty,
            name: name ?? "",
            next_episode_to_air: next_episode_to_air?.toDomain() ?? .empty,
            networks: networks?.map { $0.toDomain() } ?? [],
            number_of_episodes: number_of_episodes ?? 0,
            number_of_seasons: number_of_seasons ?? 0,
            original_language: original_language ?? "",
            original_name: original_name ?? "",
            overview: overview ?? "",
            popularity: popularity ?? 0,
            poster_path: poster_path ?? "",
            seasons: seasons?.map { $0.toDomain() } ?? [],
            status: status ?? "",
            tagline: tagline ?? "",
            vote_average: vote_average ?? 0,
            vote_count: vote_count ?? 0
        )
    }
}

struct CreatedByItemDTO: Decodable {
    let id: Int
    let credit_id: String
    let name: String
    let gender: Int
    let profile_path: String?
    
    func toDomain() -> CreatedByItem {
        return CreatedByItem(
            id: id,
            credit_id: credit_id,
            name: name,
            gender: gender,
            profile_path: profile_path ?? ""
        )
    }
    
}

struct LastEpisodeToAirDTO: Decodable {
    let air_date: String
    let episode_number: Int
    let id: Int
    let name: String
    let overview: String
    let season_number: Int
    let show_id: Int
    let still_path: String?
    let vote_average: Double
    let vote_count: Int
    
    func toDomain() -> LastEpisodeToAir {
        return LastEpisodeToAir(
            air_date: air_date,
            episode_number: episode_number,
            id: id,
            name: name,
            overview: overview,
            season_number: season_number,
            show_id: show_id,
            still_path: still_path ?? "",
            vote_average: vote_average,
            vote_count: vote_count
        )
    }
    
}

struct NextEpisodeToAirDTO: Decodable {
    let air_date: String?
    let episode_number: Int?
    let id: Int?
    let name: String?
    let overview: String?
    let season_number: Int?
    let show_id: Int?
    let still_path: String?
    let vote_average: Double?
    let vote_count: Int?
    
    func toDomain() -> NextEpisodeToAir {
        return NextEpisodeToAir(
            air_date: air_date,
            episode_number: episode_number,
            id: id,
            name: name,
            overview: overview,
            season_number: season_number,
            show_id: show_id,
            still_path: still_path ?? "",
            vote_average: vote_average ?? 0,
            vote_count: vote_count ?? 0
        )
    }
    
}

struct NetworkDTO: Decodable {
    let id: Int
    let name: String
    let logo_path: String?
    let origin_country: String
    
    func toDomain() -> Network {
        return Network(
            id: id,
            name: name,
            logo_path: logo_path ?? "",
            origin_country: origin_country
        )
    }
}

struct SeasonDTO: Decodable {
    let air_date: String
    let episode_count: Int
    let id: Int
    let name: String
    let overview: String
    let poster_path: String?
    let season_number: Int
    
    func toDomain() -> Season {
        return Season(
            air_date: air_date,
            episode_count: episode_count,
            id: id,
            name: name,
            overview: overview,
            poster_path: poster_path ?? "",
            season_number: season_number
        )
    }
}

struct SeriesSeasonDTO: Decodable {
    let air_date: String?
    let episodes: [EpisodeDTO]?
    let id: Int?
    let name: String?
    let overview: String?
    let poster_path: String?
    let season_number: Int?

    func toDomain() -> SeriesSeason {
        return SeriesSeason(
            air_date: air_date ?? "",
            episodes: episodes?.map { $0.toDomain() } ?? [],
            id: id ?? 0,
            name: name ?? "",
            overview: overview ?? "",
            poster_path: poster_path ?? "",
            season_number: season_number ?? 0
        )
    }
}

struct EpisodeDTO: Decodable {
    let air_date: String?
    let episode_number: Int?
    let id: Int?
    let name: String?
    let runtime: Int?
    let overview: String?
    let still_path: String?
    let season_number: Int?
    let vote_average: Double?
    let vote_count: Int?
    
    func toDomain() -> Episode {
        return Episode(
            air_date: air_date ?? "",
            episode_number: episode_number ?? 0,
            id: id ?? 0,
            name: name ?? "",
            runtime: runtime ?? 0,
            overview: overview ?? "",
            still_path: still_path ?? "",
            season_number: season_number ?? 0,
            vote_average: vote_average ?? 0.0,
            vote_count: vote_count ?? 0
        )
    }
}
