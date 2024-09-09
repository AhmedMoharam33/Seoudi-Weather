//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

extension UIButton: UITextEditable {
    public var baselineAdjustment: UIBaselineAdjustment {
        get { titleLabel?.baselineAdjustment ?? .none }
        set { titleLabel?.baselineAdjustment = newValue }
    }

    public var attributedInputText: NSAttributedString? {
        get { attributedTitle(for: .normal) }
        set { setAttributedTitle(newValue, for: .normal) }
    }

    public var adjustsFontSizeToFitWidth: Bool {
        get { titleLabel?.adjustsFontSizeToFitWidth ?? false }
        set { titleLabel?.adjustsFontSizeToFitWidth = newValue }
    }

    public var adjustsFontForContentSizeCategory: Bool {
        get { titleLabel?.adjustsFontForContentSizeCategory ?? false }
        set { titleLabel?.adjustsFontForContentSizeCategory = newValue }
    }

    public var textInput: String {
        get { title(for: .normal) ?? "" }
        set { setTitle(newValue, for: .normal) }
    }

    public var textInputColor: UIColor? {
        get { titleColor(for: .normal) }
        set { setTitleColor(newValue, for: .normal) }
    }

    public var textInputFont: UIFont? {
        get { titleLabel?.font }
        set { titleLabel?.font = newValue }
    }

    public var textInputAlignment: NSTextAlignment {
        get { titleLabel?.textAlignment ?? .justified }
        set { titleLabel?.textAlignment = newValue }
    }
}
