//
//  ContentView.swift
//  Spelltome
//
//  Created by Guilherme Garcia on 24/03/26.
//

import SwiftUI

struct SpellListView: View {
    
    @State private var isSearchFocused: Bool = false
    
#if DEBUG
    @StateObject private var viewModel = SpellListViewModel(service: SpellServiceMock())
#else
    @StateObject private var viewModel = SpellListViewModel(service: SpellService())
#endif
    
    var body: some View {
        NavigationStack {
            List {
                if viewModel.searchText.isEmpty {
                    ForEach(viewModel.spellsByLevel, id: \.key) { group in
                        NavigationLink(group.key.ordinalSpellLevel, destination: SpellLevelDetailView(spellList: group.value, spellLevel: group.key))
                    }
                } else {
                    FilteredSpellListView(spellList: viewModel.filteredSpells)
                }
            }
            .navigationTitle("SpellTome")
            .onAppear{
                viewModel.searchText = ""
                isSearchFocused = false
            }
        }
        .searchable(
            text: $viewModel.searchText,
            isPresented: $isSearchFocused,
            prompt: "Search"
        )
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
