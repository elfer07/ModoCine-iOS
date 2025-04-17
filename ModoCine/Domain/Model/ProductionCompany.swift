//
//  ProductionCompany.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

struct ProductionCompany: Decodable {
    let id: Int
    let logoPath: String?
    let name: String
    let originCountry: String
}
