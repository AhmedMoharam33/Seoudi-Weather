//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension CGSize {
    init(_ value: CGFloat) {
        self.init(width: value, height: value)
    }
}

public extension CGSize {
    func width(_ value: CGFloat) -> CGSize {
        CGSize(width: value, height: height)
    }

    func height(_ value: CGFloat) -> CGSize {
        CGSize(width: width, height: value)
    }
}

public extension CGSize {
    static func width(_ value: CGFloat) -> CGSize {
        CGSize(width: value, height: 0)
    }

    static func height(_ value: CGFloat) -> CGSize {
        CGSize(width: 0, height: value)
    }
}
