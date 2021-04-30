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

    var overAllRating:Int{
        //FORMULA
        //Strength + Intelligence + Speed + Endurance + Firepower
        let formula1 = (strength ?? 0) + (intelligence ?? 0)  + (speed ?? 0)
        let overAll =  (formula1) + (endurance  ?? 0) + (firepower ?? 0)
        return overAll
    }
    
    var isOptimusPrime:Bool{
        return name == "Optimus Prime"
    }
    
    var isPredaking:Bool{
        return name == "Predaking"
    }
    
    
    
    enum CodingKeys: String, CodingKey {
        case courage, endurance, firepower, id, intelligence, name, rank, skill, speed, strength, team
        case teamIcon = "team_icon"
    }
    
   // Strength Intelligence Speed
  //  Endurance Firepower Rank Skill Courage
    func toString()->String  {
        "\(team!) \(name!): \(strength!),\(intelligence!),\(speed!),\(endurance!),\(firepower!),\(rank!),\(skill!),\(courage!)\n"
    }
    
}

struct TransformsItems:Codable {
    let transformers: [Transformer]?
}
