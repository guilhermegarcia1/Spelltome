//
//  SpellListResponse.swift
//  Spelltome
//
//  Created by Guilherme Garcia on 30/03/26.
//

import Foundation

struct SpellListResponse: Codable {
    let count: Int
    let results: [Spell]
}
