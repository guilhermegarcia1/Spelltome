//
//  ContentView.swift
//  Spelltome
//
//  Created by Guilherme Garcia on 24/03/26.
//

import SwiftUI

struct SpellListView: View {
    
    #if DEBUG
    @StateObject private var viewModel = SpellListViewModel(service: SpellServiceMock())
    #else
    @StateObject private var viewModel = SpellListViewModel(service: SpellService())
    #endif
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(viewModel.spellsByLevel, id: \.key) { group in
                    Section(group.key == 0 ? "Cantrip" : "Magias de \(group.key)º nível") {
                        ForEach(group.value) { spell in
                            NavigationLink(spell.name, destination: SpellDetailView(spell: spell))
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
        .preferredColorScheme(.dark)
}

#Preview {
    SpellListView()
        .preferredColorScheme(.light)
}
