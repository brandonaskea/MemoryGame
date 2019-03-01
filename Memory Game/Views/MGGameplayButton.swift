//
//  MGGameplayButton.swift
//  Memory Game
//
//  Created by Brandon Askea on 3/1/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import UIKit

class MGGameplayButton: UIButton {
    public func configure() {
        setTitle(MGGameplayOption.stringFor(tag: tag) , for: .normal)
        setTitleColor(MGConstants.mainColor, for: .normal)
        backgroundColor = MGConstants.secondaryColor
        layer.cornerRadius = MGConstants.buttonCornerRadius
    }
}
