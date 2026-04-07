//
//  SpellServiceProtocol.swift
//  Spelltome
//
//  Created by Guilherme Garcia on 05/04/26.
//

import Foundation

protocol SpellServiceProtocol {
    func fetchSpells() async throws -> [Spell]
}
