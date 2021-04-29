//
//  Transformer.swift
//  Transformers
//
//  Created by Ahsan Ali on 28/04/2021.
//

import Foundation
// MARK: - Tranformer
struct Transformer: Codable {
    let courage, endurance, firepower: Int?
    let id: String?
    let intelligence: Int?
    let name: String?
    let rank, skill, speed, strength: Int?
    let team: String?
    let teamIcon: String?

    enum CodingKeys: String, CodingKey {
        case courage, endurance, firepower, id, intelligence, name, rank, skill, speed, strength, team
        case teamIcon = "team_icon"
    }
    

    
}

struct TransformsItems:Codable {
    let transformers: [Transformer]?
}
