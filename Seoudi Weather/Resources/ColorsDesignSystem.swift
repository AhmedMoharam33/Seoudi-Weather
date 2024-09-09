//
//  ColorDesignSystem.swift
//  Seoudi Weather
//
//  Created by ahmed moharam on 30/08/2024.
//

import UIKit

/// I usually use Swift Gen (fonts, images, storyboards)
struct ColorDesignSystem {
    
    enum Colors: String {

        case white = "White"
        
        var color: UIColor {
            return UIColor(named: self.rawValue) ?? UIColor()
        }
    }
}
