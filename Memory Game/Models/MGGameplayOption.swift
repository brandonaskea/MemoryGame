//
//  MGGameplayMode.swift
//  Memory Game
//
//  Created by Brandon Askea on 3/1/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import UIKit

enum MGGameplayOption: String {
    case one    = "3x4"
    case two    = "5x2"
    case three  = "4x4"
    case four   = "4x5"
    static func stringFor(tag: Int) -> String {
        switch tag {
        case 1: return MGGameplayOption.one.rawValue
        case 2: return MGGameplayOption.two.rawValue
        case 3: return MGGameplayOption.three.rawValue
        case 4: return MGGameplayOption.four.rawValue
        default:
            return MGGameplayOption.one.rawValue // should never execute
        }
    }
    static func sizeFor(option: MGGameplayOption) -> CGSize {
        let string = option.rawValue
        let splice = string.components(separatedBy: MGConstants.sizeSpliceChar)
        if splice.count == 2 {
            return CGSize(width: Int(splice[0]) ?? 0, height: Int(splice[1]) ?? 0)
        }
        return .zero
    }
}
