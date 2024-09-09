//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UIBarButtonItem {
    static var flexibleSpace: UIBarButtonItem {
        return UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
    }
}

public extension UIBarButtonItem {
    static func fixedSpace(width: CGFloat) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem.flexibleSpace
        barButtonItem.width = width
        return barButtonItem
    }
}
