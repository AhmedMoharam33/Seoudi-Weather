//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public protocol UITextEditable: AnyObject {
    var textInput: String { get set }
    var attributedInputText: NSAttributedString? { get set }
    var textInputColor: UIColor? { get set }
    var textInputFont: UIFont? { get set }
    var textInputAlignment: NSTextAlignment { get set }
    var adjustsFontSizeToFitWidth: Bool { get set }
    var adjustsFontForContentSizeCategory: Bool { get set }
    var baselineAdjustment: UIBaselineAdjustment { get set }
}

public extension UITextEditable {
    @discardableResult
    func text(_ string: String) -> Self {
        textInput = string
        return self
    }

    @discardableResult
    func text(_ string: NSAttributedString) -> Self {
        attributedInputText = string
        return self
    }

    @available(iOS, deprecated: 13.0, renamed: "textColor")
    @discardableResult
    func text(color: UIColor) -> Self {
        textInputColor = color
        return self
    }

    @discardableResult
    func textColor(_ color: UIColor?) -> Self {
        textInputColor = color
        return self
    }

    @discardableResult
    func font(_ font: UIFont?) -> Self {
        textInputFont = font
        return self
    }

    @available(iOS, deprecated: 13.0, renamed: "textAlignment")
    @discardableResult
    func text(alignment: NSTextAlignment) -> Self {
        textInputAlignment = alignment
        return self
    }

    @discardableResult
    func textAlignment(_ alignment: NSTextAlignment) -> Self {
        textInputAlignment = alignment
        return self
    }

    @discardableResult
    func text(key: String, comment: String = "") -> Self {
        textInput = NSLocalizedString(key, comment: comment)
        return self
    }
}
