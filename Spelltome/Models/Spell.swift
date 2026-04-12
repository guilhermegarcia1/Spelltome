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
    let material: String
    let duration: String
    let description: String
    var componentsFormatted: String {
        return material == "" ? components : "\(components) \(material)"
    }
    
    var descriptionFormatted: AttributedString {
        let markdownOption = AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnlyPreservingWhitespace)
        let magicDescription: String  = description
        let searchWords = "At Higher Levels"
        var attrString = try! AttributedString(markdown: magicDescription, options: markdownOption)
        
        if let range = attrString.range(of: searchWords) {
            attrString[range].inlinePresentationIntent = .stronglyEmphasized
        }
        
        return attrString
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "slug"
        case name
        case level
        case levelInt = "level_int"
        case school
        case castingTime = "casting_time"
        case range
        case components
        case material
        case duration
        case description = "desc"
    }
}
