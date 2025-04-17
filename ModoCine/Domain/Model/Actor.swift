//
//  Actor.swift
//  ModoCine
//
//  Created by Fernando Moreno on 14/04/2025.
//

import Foundation

struct Actor: Identifiable {
    let gender: Int
    let id: Int
    let name: String
    let popularity: Double
    let profilePath: String?
    let character: String
    let order: Int
}
