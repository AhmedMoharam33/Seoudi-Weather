//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension CACornerMask {
    static let allCorners: CACornerMask = [
        .layerMinXMinYCorner,
        .layerMinXMaxYCorner,
        .layerMaxXMinYCorner,
        .layerMaxXMaxYCorner,
    ]
}

public extension CACornerMask {
    init(_ rectCorner: UIRectCorner) {
        var caCorners = CACornerMask()
        if rectCorner.contains(.allCorners) {
            caCorners = .allCorners
        } else {
            if rectCorner.contains(.topRight) {
                caCorners.insert(.layerMaxXMinYCorner)
            }

            if rectCorner.contains(.topLeft) {
                caCorners.insert(.layerMinXMinYCorner)
            }

            if rectCorner.contains(.bottomRight) {
                caCorners.insert(.layerMaxXMaxYCorner)
            }

            if rectCorner.contains(.bottomLeft) {
                caCorners.insert(.layerMinXMaxYCorner)
            }
        }
        self.init([caCorners])
    }

    func toUIRectCorner() -> UIRectCorner {
        UIRectCorner(self)
    }
}
