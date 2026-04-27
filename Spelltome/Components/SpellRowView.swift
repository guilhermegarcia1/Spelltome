//
//  SpellRowView.swift
//  Spelltome
//
//  Created by Guilherme Garcia on 26/04/26.
//

import SwiftUI

struct SpellRowView: View {
    let spell: Spell
    
    var body: some View {
        VStack(alignment: .leading){
            Text("\(spell.name)")
            Text("\(spell.level), \(spell.school)")
                .font(.caption)
                .italic()
        }
    }
}

#Preview {
    SpellRowView(spell: SpellServiceMock().spells[0])
        .preferredColorScheme(.dark)
}

#Preview {
    SpellRowView(spell: SpellServiceMock().spells[1])
        .preferredColorScheme(.light)
}
