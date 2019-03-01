//
//  MGConstants.swift
//  Memory Game
//
//  Created by Brandon Askea on 3/1/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import UIKit

struct MGConstants {
    static let headerTitle     = "Memory Game"
    static let sceneName       = "MGScene"
    
    static let mainColor = UIColor(red: (63/255.0), green: (231/255.0), blue: (255/255.0), alpha: 1)
    static let secondaryColor = UIColor(red: (0/255.0), green: (143/255.0), blue: (196/255.0), alpha: 1)
    
    static let buttonCornerRadius:CGFloat = 6
    static let buttonTitleFont:UIFont = UIFont(name: "Noteworthy-Bold", size: 16) ?? UIFont.systemFont(ofSize: 16)
    static let buttonTitleStrokeColor:UIColor = .white
    static let buttonTitleStrokeWidth:CGFloat = -4.0
    static let buttonDescriptionFont = UIFont(name: "Noteworthy-Bold", size: 12) ?? UIFont.systemFont(ofSize: 12)
    static let buttonDescriptionStrokeColor:UIColor = MGConstants.mainColor
    static let buttonDescriptionStrokeWidth:CGFloat = -2.0
    
    static let sizeSpliceChar = "x"
}
