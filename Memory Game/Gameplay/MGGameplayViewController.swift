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

private let sceneName = "MGScene"

class MGGameplayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let view = self.view as? SKView,
        let scene = SKScene(fileNamed: sceneName)
        else { return }
        
        scene.scaleMode = .aspectFill
        
        view.presentScene(scene)
        view.ignoresSiblingOrder = true
        view.showsFPS = true
        view.showsNodeCount = true
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
