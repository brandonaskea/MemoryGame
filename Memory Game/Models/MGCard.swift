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
    
    private var type: MGCardType = .unknown
    
    init(size: CGSize) {
        super.init(texture: nil, color: .clear, size: size)
        updateWith(cardType: type)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateWith(cardType: MGCardType) {
        type = cardType
        texture = SKTexture(imageNamed: "card_\(type.rawValue)")
    }
    
}
