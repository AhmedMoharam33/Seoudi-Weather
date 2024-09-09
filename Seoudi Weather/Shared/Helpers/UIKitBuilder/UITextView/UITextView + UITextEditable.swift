//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

extension UITextView: UITextEditable {
    public var baselineAdjustment: UIBaselineAdjustment {
        get { .none }
        set { }
    }

    public var attributedInputText: NSAttributedString? {
        get { nil }
        set { }
    }

    public var adjustsFontSizeToFitWidth: Bool {
        get { false }
        set { }
    }

    public var textInput: String {
        get { text ?? "" }
        set { text = newValue }
    }

    public var textInputColor: UIColor? {
        get { textColor }
        set { textColor = newValue }
    }

    public var textInputFont: UIFont? {
        get { font }
        set { font = newValue }
    }

    public var textInputAlignment: NSTextAlignment {
        get { textAlignment }
        set { textAlignment = newValue }
    }
}
