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
    var types: [MGCardType] = []
    var cards: [MGCard] = []
    var gameSize: CGSize = .zero
    var selectedCard: MGCard? = nil
    var cardToMatch: MGCard? = nil
    
    // MARK: Set Up
    
    init(fileNamed: String, gameplayOption: MGGameplayOption) {
        let size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        super.init(size: size)
        option = gameplayOption
        gameSize = MGGameplayOption.sizeFor(option: option)
        types = MGCardType.typesFor(total: Int(gameSize.width * gameSize.height))
        scaleMode = .aspectFit
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        setUpRows()
    }
    
    func setUpRows() {
        let numberOfRows = Int(gameSize.height)
        let numberOfCards = Int(gameSize.width)
        for i in 0..<numberOfRows {
            setUpCardsFor(row: i, numberOfCards: numberOfCards)
        }
    }
    
    func setUpCardsFor(row: Int, numberOfCards: Int) {
        let screenWidth = self.frame.size.width
        let padding = MGConstants.gameplayCardsPadding
        let cardWidth = ((screenWidth - (padding * CGFloat(numberOfCards + 1))) / gameSize.width)
        let cardHeight = cardWidth
        for i in 0..<numberOfCards {
            let xPosition:CGFloat = (cardWidth * CGFloat(i)) + padding + (padding * CGFloat(i))
            let yPosition:CGFloat = (cardHeight * CGFloat(row)) + padding + (padding * CGFloat(row))
            let card = MGCard(size: CGSize(width: cardWidth, height: cardHeight), cardType: types.removeFirst())
            card.position = CGPoint(x: xPosition, y: yPosition)
            card.anchorPoint = CGPoint(x: 0, y: 0)
            cards.append(card)
            addChild(card)
        }
    }
    
    // MARK: User Input
    
    private func cardAt(_ touch: UITouch) -> MGCard? {
        let point = touch.location(in: self)
        let spriteNodes = nodes(at: point)
        return spriteNodes.first as? MGCard
    }
    
    private func resultWith(_ touch: UITouch) {
        /*
         (1) Ensure that the touched card is indeed the one the user intended to select.
         (2) If so, determine if there is already a card to match against.
         (3) If not, the card is marked as the one to be matched next.
         (4) If they are a match both are removed from the cards collection.
         (5) If they are not a match both are 'flipped' after 1 second.
         (6) When all cards have been removed, all have been matched. Game over.
        */
        guard let card = cardAt(touch),
        let selected = selectedCard,
        card == selected // (1)
        else { selectedCard = nil; return }
        if let matchCard = cardToMatch { // (2)
            if card.type == matchCard.type {
                cards.removeAll { (c) -> Bool in // (4)
                    return c.type == card.type
                }
                if cards.isEmpty { // (6)
                    print("GAME OVER!")
                }
            }
            else { // (5)
                DispatchQueue.main.asyncAfter(deadline: .now()
                    + MGConstants.gameplayFailureDelay) {
                        card.revert()
                        matchCard.revert()
                }
            }
            cardToMatch = nil
        }
        else { // (3)
            cardToMatch = card
        }
        card.show()
        selectedCard = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        selectedCard = cardAt(touch)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        resultWith(touch)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        selectedCard = nil
    }
    
}
