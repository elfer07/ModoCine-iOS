//
//  ProductionCountryDTO.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

struct ProductionCountryDTO: Decodable {
    let iso_3166_1: String?
    let name: String?
    
    func toDomain() -> ProductionCountry {
        return ProductionCountry(iso31661: iso_3166_1, name: name)
    }
}
