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
    @Published var searchText: String = ""
    @Published var typeFilter: TypeFilter = .name
    @Published var selectedSchool: SpellSchool? = nil
    @Published var selectedClass: SpellClass? = nil
    
    let spellService: SpellServiceProtocol
    
    init(service: SpellServiceProtocol){
        self.spellService = service
    }
    
    func loadSpells() async {
        do {
            spells = try await spellService.fetchSpells()
        } catch {
            print("Erro ao buscar magias: \(error)")
        }
    }
    
    var spellsFilteredBy: [Spell] {
        switch(typeFilter) {
            case .school:
                guard let spellsBySchool = selectedSchool?.rawValue else {
                    if searchText.count == 0 {
                        return spells
                    } else {
                        return spells.filter{ $0.name.contains(searchText) }
                    }
                }
                
                if searchText.count == 0 {
                    return spells.filter{ $0.school.contains(spellsBySchool) }
                } else {
                    return spells.filter{ $0.school.contains(spellsBySchool) && $0.name.contains(searchText) }
                }
            case .charClass:
                guard let spellsByClass = selectedClass?.rawValue else {
                    if searchText.count == 0 {
                        return spells
                    } else {
                        return spells.filter { $0.name.contains(searchText) }
                    }
                }
                
                if searchText.count == 0 {
                    return spells.filter{ $0.charClass.contains(spellsByClass) }
                } else {
                    return spells.filter{ $0.charClass.contains(spellsByClass) && $0.name.contains(searchText) }
                }
            default:
                if searchText.count == 0 {
                    return spells
                } else {
                    return spells.filter{ $0.name.contains(searchText) }
                }
        }
    }
    
    var spellsByLevel: [(key: Int, value: [Spell])] {
        let grouped = Dictionary(grouping: spellsFilteredBy, by: { $0.levelInt })
        
        return grouped.sorted { $0.key < $1.key }.map {(key: $0.key, value: $0.value)}
    }
    
    var filteredSpells: [Spell] {
        return spellsFilteredBy
    }
    
    var selectedFilter: String {
        switch(typeFilter) {
            case .school:
                return "Filter by: School"
            case .charClass:
                return "Filter by: Class"
            default:
                return "Filter by: Name"
        }
    }
    
}
