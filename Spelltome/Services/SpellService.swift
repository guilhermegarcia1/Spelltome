//
//  SpellService.swift
//  Spelltome
//
//  Created by Guilherme Garcia on 29/03/26.
//

import Foundation

class SpellService: SpellServiceProtocol {
    
    let urlString: String = "https://api.open5e.com/v1/spells/?limit=500&document__slug=wotc-srd"
    
    func fetchSpells() async throws -> [Spell] {
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(SpellListResponse.self, from: data)
        
        return response.results
        
    }
    
}
