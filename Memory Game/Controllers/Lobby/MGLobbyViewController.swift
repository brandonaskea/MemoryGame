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
    
    // MARK: Set Up
    
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
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let option = sender as? MGGameplayOption,
        let gameplayVC = segue.destination as? MGGameplayViewController else { return }
        gameplayVC.option = option
    }
    
    // MARK: Button Actions
    
    @IBAction func gameplayButtonTapped(_ sender: MGGameplayButton) {
        performSegue(withIdentifier: MGConstants.gameplaySegueID, sender: sender.option)
    }

}
