//
//  ContentView.swift
//  Spelltome
//
//  Created by Guilherme Garcia on 24/03/26.
//

import SwiftUI

struct SpellListView: View {
    
    @StateObject private var viewModel = SpellListViewModel(service: SpellService())
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(viewModel.spellsByLevel, id: \.key) { group in
                    Section(group.key == 0 ? "Cantrip" : "Magias de \(group.key)º nível") {
                        ForEach(group.value) { spell in
                            Text(spell.name)
                        }
                    }
                }
            }
            .navigationTitle("SpellTome")
        }
        .task {
            await viewModel.loadSpells()
        }
        
    }
    
}

#Preview {
    SpellListView()
}
