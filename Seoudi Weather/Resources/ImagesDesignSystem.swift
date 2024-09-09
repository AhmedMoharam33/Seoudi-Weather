//
//  ImagesDesignSystem.swift
//  Seoudi Weather
//
//  Created by ahmed moharam on 30/08/2024.
//

import UIKit

/// I usually use Swift Gen (fonts, images, storyboards)
struct ImagesDesignSystem {
    
    enum images: String {

        case loadingPagePlaceHolder = "SplashScreen"
        
        case alexIcon = "Alex"
        case cairoIcon = "Cairo"
        case domiatIcon = "Domiat"
        case dubaiIcon = "Dubai"
        case franceIcon = "France"
        case lebiaIcon = "Lebia"
        case matro7Icon = "Matro7"
        case night = "Night"
        case location = "Location"
        case temperature = "temperature"
        
        var image: UIImage {
            return UIImage(named: self.rawValue) ?? UIImage()
        }
    }
}


