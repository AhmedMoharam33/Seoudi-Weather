//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UIRectCorner {
    init(_ caCorners: CACornerMask) {
        var rectCorners = UIRectCorner()
        if caCorners.contains(.layerMinXMinYCorner) {
            rectCorners.insert(.topLeft)
        }

        if caCorners.contains(.layerMaxXMinYCorner) {
            rectCorners.insert(.topRight)
        }

        if caCorners.contains(.layerMinXMaxYCorner) {
            rectCorners.insert(.bottomLeft)
        }

        if caCorners.contains(.layerMaxXMaxYCorner) {
            rectCorners.insert(.bottomRight)
        }
        self.init([rectCorners])
    }

    func toCACornerMask() -> CACornerMask {
        CACornerMask(self)
    }
}

public extension UIRectCorner {
    static let top: UIRectCorner = [.topRight, .topLeft]
    static let bottom: UIRectCorner = [.bottomRight, .bottomLeft]
    static let trailing: UIRectCorner = [.topRight, .bottomRight]
    static let leading: UIRectCorner = [.topLeft, .bottomLeft]
}
