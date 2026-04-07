//
//  SpellServiceMock.swift
//  Spelltome
//
//  Created by Guilherme Garcia on 05/04/26.
//

import Foundation

struct SpellServiceMock: SpellServiceProtocol {
    
    let spells: [Spell] = [Spell(
                            name: "Fireball",
                            level: "3rd-level",
                            levelInt: 3,
                            school: "Evocation",
                            castingTime: "1 Action",
                            range: "150 feet",
                            components: "V, S, M",
                            duration: "Instantaneous",
                            description: "A bright streak flashes from your pointing finger to a point you choose within range and then blossoms with a low roar into an explosion of flame. Each creature in a 20-foot-radius sphere centered on that point must make a Dexterity saving throw. A target takes 8d6 fire damage on a failed save, or half as much damage on a successful one.\nThe fire spreads around corners. It ignites flammable objects in the area that aren't being worn or carried.\nAt Higher Levels. When you cast this spell using a spell slot of 4th level or higher, the damage increases by 1d6 for each slot level above 3rd."
                          ),
                          Spell(
                            name: "Magic Missile",
                            level: "1st-level",
                            levelInt: 1,
                            school: "Evocation",
                            castingTime: "1 Action",
                            range: "120 feet",
                            components: "V, S",
                            duration: "Instantaneous",
                            description: "You create three glowing darts of magical force. Each dart hits a creature of your choice that you can see within range. A dart deals 1d4 + 1 force damage to its target. The darts all strike simultaneously, and you can direct them to hit one creature or several.\nAt Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, the spell creates one more dart for each slot level above 1st."
                          ),
                          Spell(
                            name: "True Resurrection",
                            level: "9th-level",
                            levelInt: 9,
                            school: "Necromancy",
                            castingTime: "1 hour",
                            range: "Touch",
                            components: "V, S, M",
                            duration: "Instantaneous",
                            description: "You touch a creature that has been dead for no longer than 200 years and that died for any reason except old age. If the creature's soul is free and willing, the creature is restored to life with all its hit points.\nThis spell closes all wounds, neutralizes any poison, cures all diseases, and lifts any curses affecting the creature when it died. The spell replaces damaged or missing organs and limbs. If the creature was undead, it is restored to its non-undead form.\nThe spell can even provide a new body if the original no longer exists, in which case you must speak the creature's name. The creature then appears in an unoccupied space you choose within 10 feet of you."
                          )]
    
    func fetchSpells() async throws -> [Spell] {
        return spells
    }
}

