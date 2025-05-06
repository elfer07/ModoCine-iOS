//
//  Series.swift
//  ModoCine
//
//  Created by Fernando Moreno on 05/05/2025.
//

struct Series: Decodable, Identifiable {
    let id: Int
    let backdrop_path: String?
    let name: String?
    let poster_path: String?
}

struct SeriesResult: Decodable {
    let results: [Series]
}

struct SeriesDetail: Decodable, Identifiable {
    let backdrop_path: String
    let created_by: [CreatedByItem]
    let first_air_date: String
    let genres: [Genres]
    let homepage: String
    let id: Int
    let in_production: Bool
    let last_air_date: String
    let last_episode_to_air: LastEpisodeToAir
    let name: String
    let next_episode_to_air: NextEpisodeToAir
    let networks: [Network]
    let number_of_episodes: Int
    let number_of_seasons: Int
    let original_language: String
    let original_name: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let seasons: [Season]
    let status: String
    let tagline: String
    let vote_average: Double
    let vote_count: Int
}
extension SeriesDetail {
    var statusDescription: String {
        switch status {
        case "Ended":
            return "Finalizada"
        case "Returning Series":
            return "En emisión"
        case "Canceled":
            return "Cancelada"
        case "In Production":
            return "En producción"
        case "Planned":
            return "Planeada"
        default:
            return status // Por si agregan nuevos estados
        }
    }
}

struct CreatedByItem: Decodable, Identifiable {
    let id: Int
    let credit_id: String
    let name: String
    let gender: Int
    let profile_path: String?
}

struct LastEpisodeToAir: Decodable, Identifiable {
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
    
    static let empty = LastEpisodeToAir(
        air_date: "",
        episode_number: 0,
        id: 0,
        name: "",
        overview: "",
        season_number: 0,
        show_id: 0,
        still_path: "",
        vote_average: 0,
        vote_count: 0
    )
}

struct NextEpisodeToAir: Decodable, Identifiable {
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
    
    static let empty = NextEpisodeToAir(
        air_date: nil,
        episode_number: nil,
        id: nil,
        name: nil,
        overview: nil,
        season_number: nil,
        show_id: nil,
        still_path: "",
        vote_average: 0,
        vote_count: 0
    )
}

struct Network: Decodable, Identifiable {
    let id: Int
    let name: String
    let logo_path: String?
    let origin_country: String
}

struct Season: Decodable, Identifiable, Hashable {
    let air_date: String
    let episode_count: Int
    let id: Int
    let name: String
    let overview: String
    let poster_path: String?
    let season_number: Int
}

struct SeriesSeason: Decodable, Identifiable {
    let air_date: String?
    let episodes: [Episode]?
    let id: Int
    let name: String?
    let overview: String?
    let poster_path: String?
    let season_number: Int?
    
    static let empty = SeriesSeason(
        air_date: "",
        episodes: [],
        id: 0,
        name: "",
        overview: "",
        poster_path: "",
        season_number: 0
    )
}

struct Episode: Decodable, Hashable {
    let air_date: String?
    let episode_number: Int?
    let id: Int
    let name: String?
    let runtime: Int?
    let overview: String?
    let still_path: String?
    let season_number: Int?
    let vote_average: Double?
    let vote_count: Int?
    
    static let empty = Episode(
        air_date: "",
        episode_number: 0,
        id: 0,
        name: "",
        runtime: 0,
        overview: "",
        still_path: "",
        season_number: 0,
        vote_average: 0,
        vote_count: 0
    )
}
