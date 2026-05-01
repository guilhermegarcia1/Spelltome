//
//  SpellLevelDetailView.swift
//  Spelltome
//
//  Created by Guilherme Garcia on 27/04/26.
//

import SwiftUI

struct SpellLevelDetailView: View {
    let spellList: [Spell]
    let spellLevel: Int
    
    var body: some View {
        List {
            ForEach(spellList) { spell in
                NavigationLink(spell.name, destination: SpellDetailView(spell: spell))
            }
        }
        .navigationTitle(spellLevel.ordinalSpellLevel)
    }
}

#Preview {
    SpellLevelDetailView(spellList: SpellServiceMock().spells, spellLevel: 1)
        .preferredColorScheme(.dark)
}

#Preview {
    SpellLevelDetailView(spellList: SpellServiceMock().spells, spellLevel: 0)
        .preferredColorScheme(.light)
}
