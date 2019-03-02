//
//  MGGameplayScene.swift
//  Memory Game
//
//  Created by Brandon Askea on 2/28/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import UIKit
import SpriteKit

class MGGameplayScene: SKScene {
    
    var option: MGGameplayOption!
    var cards: [MGCard] = []
    var gameSize: CGSize = .zero
    
    // MARK: Set Up
    
    init(fileNamed: String, option: MGGameplayOption) {
        let size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        super.init(size: size)
        self.option = option
        gameSize = MGGameplayOption.sizeFor(option: option)
        scaleMode = .aspectFit
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    override func didMove(to view: SKView) {
        setUpRows()
    }
    
    func setUpRows() {
        let size = MGGameplayOption.sizeFor(option: option)
        let numberOfRows = Int(size.height)
        let numberOfCards = Int(size.width)
        for i in 0..<numberOfRows {
            setUpCardsFor(row: i, numberOfCards: numberOfCards)
        }
    }
    
    func setUpCardsFor(row: Int, numberOfCards: Int) {
        let size = MGGameplayOption.sizeFor(option: option)
        let screenWidth = self.frame.size.width
        let cardWidth = screenWidth / size.width
        let cardHeight = cardWidth
        for i in 0..<numberOfCards {
            let xPosition:CGFloat = cardWidth * CGFloat(i)
            let yPosition:CGFloat = cardHeight * CGFloat(row)
            let card = MGCard(size: CGSize(width: cardWidth, height: cardHeight))
            card.position = CGPoint(x: xPosition, y: yPosition)
            card.anchorPoint = CGPoint(x: 0, y: 0)
            cards.append(card)
            addChild(card)
        }
    }
    
    // MARK: User Input
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    
    override func update(_ currentTime: TimeInterval) {

    }
}
