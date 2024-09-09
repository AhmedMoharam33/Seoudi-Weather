//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UILabel {
    convenience init(_ text: String) {
        self.init(frame: .zero)
        self.text = text
    }

    static func text(_ text: String) -> UILabel {
        UILabel(text)
    }
}

public extension UILabel {
    @discardableResult
    func lines(_ lines: Int) -> Self {
        numberOfLines = lines
        return self
    }
}
