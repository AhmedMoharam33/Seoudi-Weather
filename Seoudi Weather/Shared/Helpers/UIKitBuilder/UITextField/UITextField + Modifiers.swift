//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UITextField {
    @available(iOS, deprecated: 13.0, renamed: "borderStyle")
    @discardableResult
    func border(style: BorderStyle) -> Self {
        borderStyle = style
        return self
    }

    @discardableResult
    func borderStyle(_ style: BorderStyle) -> Self {
        borderStyle = style
        return self
    }

    @discardableResult
    func placeholder(_ string: String) -> Self {
        placeholder = string
        return self
    }

    @discardableResult
    func returnKey(_ type: UIReturnKeyType) -> Self {
        returnKeyType = type
        return self
    }

    @available(iOS, deprecated: 13.0, renamed: "clearButtonMode")
    @discardableResult
    func clearButton(mode: UITextField.ViewMode) -> Self {
        clearButtonMode = mode
        return self
    }

    @discardableResult
    func clearButtonMode(_ mode: UITextField.ViewMode) -> Self {
        clearButtonMode = mode
        return self
    }

    @discardableResult
    func delegate(_ delegate: UITextFieldDelegate?) -> Self {
        self.delegate = delegate
        return self
    }

    @discardableResult
    func onEditingChanged(_ target: Any?, perform action: Selector) -> Self {
        addTarget(target, action: action, for: .editingChanged)
        return self
    }
}

public extension UITextField {
    enum PaddingPosition {
        case right
        case left
    }

    @discardableResult
    func padding(
        _ position: PaddingPosition,
        _ width: CGFloat,
        mode _: UITextField.ViewMode = .always
    ) -> Self {
        let paddingView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: width,
            height: frame.size.height
        ))
        switch position {
        case .left:
            leftView = paddingView
            leftViewMode = .always

        case .right:
            rightView = paddingView
            rightViewMode = .always
        }
        return self
    }

    @discardableResult
    func padding(_ width: CGFloat) -> Self {
        let paddingView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: width,
            height: frame.size.height
        ))
        leftView = paddingView
        rightView = paddingView
        leftViewMode = .always
        rightViewMode = .always
        return self
    }
}
