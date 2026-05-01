//
//  Int+Extentions.swift
//  Spelltome
//
//  Created by Guilherme Garcia on 29/04/26.
//

import Foundation

extension Int {
    var ordinalSpellLevel: String {
        switch self {
            case 1: return "1st Level Spells"
            case 2: return "2nd Level Spells"
            case 3: return "3rd Level Spells"
            case 4: return "4th Level Spells"
            case 5: return "5th Level Spells"
            case 6: return "6th Level Spells"
            case 7: return "7th Level Spells"
            case 8: return "8th Level Spells"
            case 9: return "9th Level Spells"
            default: return "Cantrips"
        }
    }
}
