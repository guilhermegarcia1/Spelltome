//
//  Spell.swift
//  Spelltome
//
//  Created by Guilherme Garcia on 25/03/26.
//

import Foundation

struct Spell: Identifiable, Codable {
    let id = UUID().uuidString
    let name: String
    let level: String
    let levelInt: Int
    let school: String
    let castingTime: String
    let range: String
    let components: String
    let duration: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "slug"
        case name
        case level
        case levelInt = "level_int"
        case school
        case castingTime = "casting_time"
        case range
        case components
        case duration
        case description = "desc"
    }
}
