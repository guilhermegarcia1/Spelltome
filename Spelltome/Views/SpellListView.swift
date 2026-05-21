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
            HStack {
                Menu {
                    Button("By Name", action: {viewModel.typeFilter = .name})
                    Button("By School", action: {viewModel.typeFilter = .school})
                    Button("By Class", action: {viewModel.typeFilter = .charClass})
                } label: {
                    Label(viewModel.selectedFilter, systemImage: "line.3.horizontal.decrease")
                }
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if viewModel.typeFilter == .school {
                    Picker("School", selection: $viewModel.selectedSchool) {
                        Text("None").tag(nil as SpellSchool?)
                        ForEach(SpellSchool.allCases, id: \.rawValue) { school in
                            Text(school.rawValue).tag(school as SpellSchool?)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                } else if viewModel.typeFilter == .charClass {
                    Picker("Class", selection: $viewModel.selectedClass) {
                        Text("None").tag(nil as SpellClass?)
                        ForEach(SpellClass.allCases, id: \.rawValue) { charClass in
                            Text(charClass.rawValue).tag(charClass as SpellClass?)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            
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
