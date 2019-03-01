//
//  MGLobbyViewController.swift
//  Memory Game
//
//  Created by Brandon Askea on 2/28/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import UIKit

class MGLobbyViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: MGHeaderLabel!
    @IBOutlet var gameplayButtons: [MGGameplayButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        
        // Header
        headerLabel.configure()
        
        // Buttons
        for button in gameplayButtons {
            button.configure()
        }
    }

}
