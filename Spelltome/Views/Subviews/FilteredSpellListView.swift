//
//  FilteredSpellListView.swift
//  Spelltome
//
//  Created by Guilherme Garcia on 26/04/26.
//

import SwiftUI

struct FilteredSpellListView: View {
    let spellList: [Spell]
    
    var body: some View {
        ForEach(spellList) { spell in
            NavigationLink(destination: SpellDetailView(spell: spell)) {
                SpellRowView(spell: spell)
            }
        }
    }
}

#Preview {
    FilteredSpellListView(spellList: SpellServiceMock().spells)
        .preferredColorScheme(.dark)
}

#Preview{
    FilteredSpellListView(spellList: SpellServiceMock().spells)
}
