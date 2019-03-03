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
    static func optionFor(tag: Int) -> MGGameplayOption {
        switch tag {
        case 1: return MGGameplayOption.one
        case 2: return MGGameplayOption.two
        case 3: return MGGameplayOption.three
        case 4: return MGGameplayOption.four
        default:
            return MGGameplayOption.one // should never execute
        }
    }
    static func descriptionFor(option: MGGameplayOption) -> String {
        let size = sizeFor(option: option)
        return "\(Int(size.height)) \(MGConstants.optionDescRows) \(Int(size.width)) \(MGConstants.optionDescCards) \(Int(size.width * size.height)) \(MGConstants.optionDescTotal)"
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
