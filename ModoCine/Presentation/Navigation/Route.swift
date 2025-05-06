//
//  Route.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

enum Route: Hashable {
    case home
    case search
    case movieDetail(Int)
    case series
    case seriesDetails(Int)
    
    var identifier: String {
        switch self {
        case .home:
            return "home"
        case .search:
            return "search"
        case .series:
            return "series"
        case .movieDetail(let id):
            return "movieDetail/\(id)"
        case .seriesDetails(let id):
            return "seriesDetails/\(id)"
        }
        
    }
    
    func has(into hasher: inout Hasher) {
        switch self {
        case .home:
            hasher.combine("home")
        case .search:
            hasher.combine("search")
        case .series:
            hasher.combine("series")
        case .movieDetail(let id):
            hasher.combine("movieDetail/\(id)")
        case .seriesDetails(let id):
            hasher.combine("seriesDetails/\(id)")
        }
    }
}
