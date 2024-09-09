//
//  WeatherEnum.swift
//  Seoudi Weather
//
//  Created by ahmed moharam on 09/09/2024.
//

import Foundation

import UIKit

enum WeatherCode: Int {
    case clearSky = 0
    case mainlyClear = 1
    case partlyCloudy = 2
    case overcast = 3
    case rainShowersSlight = 61
    case rainShowersModerate = 63
    case lightShowers = 80
    case moderateShowers = 81
    case heavyShowers = 82
    case thunderstormsSlight = 95
    case unknown // For any unknown values

    func iconName() -> String {
        switch self {
        case .clearSky:
            return "sun.max"
        case .mainlyClear:
            return "cloud.sun"
        case .partlyCloudy:
            return "cloud.sun.fill"
        case .overcast:
            return "cloud.fill"
        case .rainShowersSlight:
            return "cloud.drizzle.fill"
        case .rainShowersModerate:
            return "cloud.rain.fill"
        case .lightShowers:
            return "cloud.drizzle"
        case .moderateShowers:
            return "cloud.rain"
        case .heavyShowers:
            return "cloud.heavyrain.fill"
        case .thunderstormsSlight:
            return "cloud.bolt.fill"
        case .unknown:
            return "questionmark.circle"
        }
    }

    func iconImage() -> UIImage? {
        return UIImage(systemName: self.iconName())?.withRenderingMode(.alwaysOriginal)
    }
}
