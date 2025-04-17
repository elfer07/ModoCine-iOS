//
//  ProductionCompanyDTO.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

struct ProductionCompanyDTO: Decodable {
    let id: Int
    let logo_path: String?
    let name: String
    let origin_country: String
    
    func toDomain() -> ProductionCompany {
        return ProductionCompany(id: id, logoPath: logo_path, name: name, originCountry: origin_country)
    }
}
