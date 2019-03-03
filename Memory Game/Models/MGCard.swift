//
//  MGCard.swift
//  Memory Game
//
//  Created by Brandon Askea on 3/1/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import UIKit
import SpriteKit

class MGCard: SKSpriteNode {
    
    var type: MGCardType = .unknown
    
    init(size: CGSize, cardType: MGCardType) {
        super.init(texture: nil, color: .clear, size: size)
        type = cardType
        revert()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateWith(cardType: MGCardType) {
        let value = cardType.rawValue
        texture = SKTexture(imageNamed: "\(MGConstants.texturePrefix)\(value)")
        if value != 0 {
            isUserInteractionEnabled = true
        }
        else {
            isUserInteractionEnabled = false
        }
    }
    
    public func show() {
        updateWith(cardType: type)
    }
    
    public func setAsMatched() {
        run(SKAction.colorize(with: MGConstants.mainColor, colorBlendFactor: MGConstants.gameplaySuccessBlend, duration: MGConstants.gameplaySuccessDurat))
    }
    
    public func revert() {
        updateWith(cardType: .unknown)
    }
    
}
