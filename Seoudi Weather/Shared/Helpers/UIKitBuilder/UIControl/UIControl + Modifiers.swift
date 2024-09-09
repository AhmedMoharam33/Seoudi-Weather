//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UIControl {
    @discardableResult
    func isEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }

    @discardableResult
    func isHighlighted(_ isHighlighted: Bool) -> Self {
        self.isHighlighted = isHighlighted
        return self
    }

    @discardableResult
    func isSelected(_ isSelected: Bool) -> Self {
        self.isSelected = isSelected
        return self
    }
}

public extension UIControl {
    @discardableResult
    override func onTap(
        _ target: Any? = nil,
        perform action: Selector
    ) -> Self {
        addTarget(target, action: action, for: .touchUpInside)
        return self
    }

    @discardableResult
    func onAction(_ event: UIControl.Event, perform action: Selector) -> Self {
        addTarget(nil, action: action, for: event)
        return self
    }
}

@available(iOS 14.0, *)
public extension UIControl {
    @discardableResult
    func onTap(perform action: @escaping (UIAction) -> Void) -> Self {
        onAction(.touchUpInside, perform: action)
    }

    @discardableResult
    func onTap(perform action: @escaping () -> Void) -> Self {
        onAction(.touchUpInside, perform: action)
    }

    @discardableResult
    func onAction(
        _ event: UIControl.Event,
        perform action: @escaping () -> Void
    ) -> Self {
        addAction(UIAction(handler: { _ in action() }), for: event)
        return self
    }

    @discardableResult
    func onAction(
        _ event: UIControl.Event,
        perform action: @escaping (UIAction) -> Void
    ) -> Self {
        addAction(UIAction(handler: action), for: event)
        return self
    }
}
