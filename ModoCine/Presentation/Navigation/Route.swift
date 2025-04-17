//
//  Route.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

enum Route: Hashable {
    case home
    case movieDetail(Int)
    
    var identifier: String {
        switch self {
        case .home:
            return "home"
        case .movieDetail(let id):
            return "movieDetail/\(id)"
        }
    }
    
    func has(into hasher: inout Hasher) {
        switch self {
        case .home:
            hasher.combine("home")
        case .movieDetail(let id):
            hasher.combine("movieDetail/\(id)")
        }
    }
}
