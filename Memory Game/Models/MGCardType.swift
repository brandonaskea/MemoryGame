//
//  MGCardType.swift
//  Memory Game
//
//  Created by Brandon Askea on 3/1/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import Foundation

enum MGCardType: Int {
    case unknown = 0, bat, cat, cow, dragon, garbageMan, ghost, hen, horse, pig, spider
}

extension MGCardType: CaseIterable {
    
    public static func typesFor(total: Int) -> [MGCardType] {
        /*
            'total' is the how many cards total are in a game.
            Per the available types, grab a random type set
            and add them to the values for the game cards.
            This will ensure no matter the size of the game
            that the types will always be random and of the
            correct amount.
        */
        let availableTypeSets:[[MGCardType]] = typeSets()
        var cardTypeSets:[[MGCardType]] = []
        cardTypeSets.append(contentsOf: availableTypeSets.prefix(upTo: total / 2))
        let types = cardTypeSets.flatMap { $0 }
        return types.shuffled()
    }
    
    private static func typeSets() -> [[MGCardType]] {
        var typeSets:[[MGCardType]] = []
        for i in MGCardType.allCases {
            if i != .unknown {
                let set = [i, i]
                typeSets.append(set)
            }
        }
        return typeSets
    }
}
