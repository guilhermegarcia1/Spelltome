//
//  SpellDetailView.swift
//  Spelltome
//
//  Created by Guilherme Garcia on 07/04/26.
//

import SwiftUI

struct SpellDetailView: View {
    let spell: Spell
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                HStack{
                    Text(spell.level).italic()
                    Text(spell.school).italic()
                }.padding(.bottom)
                HStack{
                    Text("Casting Time:").bold()
                    Text(spell.castingTime)
                }
                HStack{
                    Text("Range:").bold()
                    Text(spell.range)
                }
                HStack(alignment: .top){
                    Text("Components:").bold()
                    Text(spell.componentsFormatted)
                }
                HStack{
                    Text("Duration:").bold()
                    Text(spell.duration)
                }.padding(.bottom)
                HStack{
                    Text(spell.descriptionFormatted).font(.body)
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle(spell.name)
    }
}

#Preview {
    SpellDetailView(spell: SpellServiceMock().spells[4])
        .preferredColorScheme(.dark)
}

#Preview {
    SpellDetailView(spell: SpellServiceMock().spells[1])
        .preferredColorScheme(.light)
}
