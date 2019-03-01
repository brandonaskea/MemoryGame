//
//  MGGameplayButton.swift
//  Memory Game
//
//  Created by Brandon Askea on 3/1/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import UIKit

class MGGameplayButton: UIButton {
    
    var option: MGGameplayOption = .one
    
    public func configure() {
        option = MGGameplayOption.optionFor(tag: tag)
        setTitleColor(MGConstants.mainColor, for: .normal)
        backgroundColor = MGConstants.secondaryColor
        layer.cornerRadius = MGConstants.buttonCornerRadius
        titleLabel?.numberOfLines = 2
        titleLabel?.textAlignment = .center
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor : MGConstants.mainColor,
            .font : MGConstants.buttonTitleFont,
            .strokeColor: MGConstants.buttonTitleStrokeColor,
            .strokeWidth: MGConstants.buttonTitleStrokeWidth
        ]
        let descriptionAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor : UIColor.white,
            .font : MGConstants.buttonDescriptionFont,
            .strokeColor: MGConstants.buttonDescriptionStrokeColor,
            .strokeWidth: MGConstants.buttonDescriptionStrokeWidth
        ]
        let attributedTitle = NSMutableAttributedString(string: "\(option.rawValue)\n\(MGGameplayOption.descriptionFor(option: option))")
        attributedTitle.addAttributes(titleAttributes, range: NSRange(location: 0, length: attributedTitle.length))
        attributedTitle.addAttributes(descriptionAttributes, range: NSRange(location: 3, length: attributedTitle.length - 3))
        setAttributedTitle(attributedTitle, for: .normal)
    }
}
