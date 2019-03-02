//
//  MGGameplayViewController.swift
//  Memory Game
//
//  Created by Brandon Askea on 2/28/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class MGGameplayViewController: UIViewController {
    
    var option: MGGameplayOption!
    
    // MARK: Set Up

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScene()
    }
    
    private func setUpScene() {
        guard let gameView = self.view as? SKView else { return }
        let scene = MGGameplayScene(fileNamed: MGConstants.sceneName, gameplayOption: option)
        gameView.presentScene(scene)
        gameView.ignoresSiblingOrder = true
        gameView.backgroundColor = .white
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
