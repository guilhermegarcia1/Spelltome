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
                            material: "(a tiny ball of bat guano and sulfur)",
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
                            material: "",
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
                            material: "(a sprinkle of holy water and diamonds worth at least 25,000 gp, which the spell consumes)",
                            duration: "Instantaneous",
                            description: "You touch a creature that has been dead for no longer than 200 years and that died for any reason except old age. If the creature's soul is free and willing, the creature is restored to life with all its hit points.\nThis spell closes all wounds, neutralizes any poison, cures all diseases, and lifts any curses affecting the creature when it died. The spell replaces damaged or missing organs and limbs. If the creature was undead, it is restored to its non-undead form.\nThe spell can even provide a new body if the original no longer exists, in which case you must speak the creature's name. The creature then appears in an unoccupied space you choose within 10 feet of you."
                          ),
                           Spell(
                            name: "Wish",
                            level: "9th-level",
                            levelInt: 9,
                            school: "Conjuration",
                            castingTime: "1 action",
                            range: "Self",
                            components: "V",
                            material: "",
                            duration: "Instantaneous",
                            description: "Wish is the mightiest spell a mortal creature can cast. By simply speaking aloud, you can alter the very foundations of reality in accord with your desires. The basic use of this spell is to duplicate any other spell of 8th level or lower. You don't need to meet any requirements in that spell, including costly components. The spell simply takes effect. Alternatively, you can create one of the following effects of your choice: \n- You create one object of up to 25,000 gp in value that isn't a magic item. The object can be no more than 300 feet in any dimension, and it appears in an unoccupied space you can see on the ground. \n- You allow up to twenty creatures that you can see to regain all hit points, and you end all effects on them described in the greater restoration spell. \n- You grant up to ten creatures you can see resistance to a damage type you choose. \n- You grant up to ten creatures you can see immunity to a single spell or other magical effect for 8 hours. For instance, you could make yourself and all your companions immune to a lich's life drain attack. \n- You undo a single recent event by forcing a reroll of any roll made within the last round (including your last turn). Reality reshapes itself to accommodate the new result. For example, a wish spell could undo an opponent's successful save, a foe's critical hit, or a friend's failed save. You can force the reroll to be made with advantage or disadvantage, and you can choose whether to use the reroll or the original roll. \nYou might be able to achieve something beyond the scope of the above examples. State your wish to the DM as precisely as possible. The DM has great latitude in ruling what occurs in such an instance; the greater the wish, the greater the likelihood that something goes wrong. This spell might simply fail, the effect you desire might only be partly achieved, or you might suffer some unforeseen consequence as a result of how you worded the wish. For example, wishing that a villain were dead might propel you forward in time to a period when that villain is no longer alive, effectively removing you from the game. Similarly, wishing for a legendary magic item or artifact might instantly transport you to the presence of the item's current owner. The stress of casting this spell to produce any effect other than duplicating another spell weakens you. After enduring that stress, each time you cast a spell until you finish a long rest, you take 1d10 necrotic damage per level of that spell. This damage can't be reduced or prevented in any way. In addition, your Strength drops to 3, if it isn't 3 or lower already, for 2d4 days. For each of those days that you spend resting and doing nothing more than light activity, your remaining recovery time decreases by 2 days. Finally, there is a 33 percent chance that you are unable to cast wish ever again if you suffer this stress."
                           ),
                           Spell(
                            name: "Command",
                            level: "1st-level",
                            levelInt: 1,
                            school: "Enchantment",
                            castingTime: "1 Action",
                            range: "60 feet",
                            components: "V",
                            material: "",
                            duration: "1 round",
                            description: "You speak a one-word command to a creature you can see within range. The target must succeed on a wisdom saving throw or follow the command on its next turn. The spell has no effect if the target is undead, if it doesn't understand your language, or if your command is directly harmful to it. Some typical commands and their effects follow. You might issue a command other than one described here. If you do so, the DM determines how the target behaves. If the target can't follow your command, the spell ends\n\n **Approach.** The target moves toward you by the shortest and most direct route, ending its turn if it moves within 5 feet of you.\n\n**Drop** The target drops whatever it is holding and then ends its turn.\n\n**Flee.** The target spends its turn moving away from you by the fastest available means.\n\n**Grovel.** The target falls prone and then ends its turn.\n\n**Halt.** The target doesn't move and takes no actions. A flying creature stays aloft, provided that it is able to do so. If it must move to stay aloft, it flies the minimum distance needed to remain in the air.\nAt Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, you can affect one additional creature for each slot level above 1st. The creatures must be within 30 feet of each other when you target them."
                           )]
    
    func fetchSpells() async throws -> [Spell] {
        return spells
    }
}

