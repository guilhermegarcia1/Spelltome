//
//  SpellListViewModel.swift
//  Spelltome
//
//  Created by Guilherme Garcia on 30/03/26.
//

import Foundation
import Combine

@MainActor
class SpellListViewModel: ObservableObject {
    
    @Published var spells: [Spell] = []
    
    let spellService: SpellService
    
    init(service: SpellService){
        self.spellService = service
    }
    
    func loadSpells() async {
        do {
            spells = try await spellService.fetchSpells()
        } catch {
            print("Erro ao buscar magias: \(error)")
        }
    }
    
    var spellsByLevel: [(key: Int, value: [Spell])] {
        let grouped = Dictionary(grouping: spells, by: { $0.levelInt })
        return grouped.sorted { $0.key < $1.key }.map {(key: $0.key, value: $0.value)}
    }
    
}
