//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UIEdgeInsets {
    init(_ allEdges: CGFloat) {
        self.init(
            top: allEdges,
            left: allEdges,
            bottom: allEdges,
            right: allEdges
        )
    }

    init(vertical: CGFloat, horizontal: CGFloat) {
        self.init(
            top: vertical,
            left: horizontal,
            bottom: vertical,
            right: horizontal
        )
    }

    init(vertical: CGFloat) {
        self.init(vertical: vertical, horizontal: 0)
    }

    init(horizontal: CGFloat) {
        self.init(vertical: 0, horizontal: horizontal)
    }
}

public extension UIEdgeInsets {
    var vertical: CGFloat {
        get { top + bottom }
        set {
            top = newValue
            bottom = newValue
        }
    }

    var horizontal: CGFloat {
        get { left + right }
        set {
            left = newValue
            right = newValue
        }
    }
}

public extension UIEdgeInsets {
    static func top(_ value: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: value, left: 0, bottom: 0, right: 0)
    }

    static func left(_ value: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: value, bottom: 0, right: 0)
    }

    static func bottom(_ value: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: value, right: 0)
    }

    static func right(_ value: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: value)
    }

    static func vertical(_ value: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: value, left: 0, bottom: value, right: 0)
    }

    static func horizontal(_ value: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: value, bottom: 0, right: value)
    }
}

public extension UIEdgeInsets {
    func top(_ value: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(
            top: value,
            left: left,
            bottom: bottom,
            right: right
        )
    }

    func left(_ value: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(
            top: top,
            left: value,
            bottom: bottom,
            right: right
        )
    }

    func bottom(_ value: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(
            top: top,
            left: left,
            bottom: value,
            right: right
        )
    }

    func right(_ value: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(
            top: top,
            left: left,
            bottom: bottom,
            right: value
        )
    }

    func vertical(_ value: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(
            top: value,
            left: left,
            bottom: value,
            right: right
        )
    }

    func horizontal(_ value: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(
            top: top,
            left: value,
            bottom: bottom,
            right: value
        )
    }
}
