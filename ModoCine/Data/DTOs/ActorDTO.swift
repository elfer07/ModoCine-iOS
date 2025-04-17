//
//  ActorDTO.swift
//  ModoCine
//
//  Created by Fernando Moreno on 14/04/2025.
//

struct ActorDTO: Decodable {
    let gender: Int
    let id: Int
    let name: String
    let popularity: Double
    let profile_path: String?
    let character: String
    let order: Int
    
    func toDomain() -> Actor {
        return Actor(
            gender: gender,
            id: id,
            name: name,
            popularity: popularity,
            profilePath: profile_path,
            character: character,
            order: order
            )
    }
}
