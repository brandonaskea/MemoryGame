//
//  MGHeaderLabel.swift
//  Memory Game
//
//  Created by Brandon Askea on 3/1/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import UIKit

class MGHeaderLabel: UILabel {
    public func configure() {
        text = MGConstants.headerTitle
        if !applyGradientWith(startColor: MGConstants.mainColor, endColor: MGConstants.secondaryColor) {
            textColor = MGConstants.mainColor
        }
    }
}
