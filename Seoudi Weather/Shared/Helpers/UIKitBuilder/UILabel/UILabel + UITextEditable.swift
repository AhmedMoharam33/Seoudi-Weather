//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

extension UILabel: UITextEditable {
    public var attributedInputText: NSAttributedString? {
        get { attributedText }
        set { attributedText = newValue }
    }

    public var textInput: String {
        get { text ?? "" }
        set { text = newValue }
    }

    public var textInputColor: UIColor? {
        get { textColor }
        set { textColor = newValue ?? .black }
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
