//
//  Genres.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

struct GenresDTO: Decodable {
    let id: Int
    let name: String
    
    func toDomain() -> Genres {
        return Genres(id: id, name: name)
    }
}
