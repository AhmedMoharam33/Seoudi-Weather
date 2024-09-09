//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

extension UIView {
    @discardableResult
    @objc open func add(to view: UIView) -> Self {
        if let stack = view as? UIStackView {
            stack.addArrangedSubview(self)
        } else {
            view.addSubview(self)
        }
        return self
    }

    @discardableResult
    @objc open func add(to view: UIView, at index: Int) -> Self {
        if let stack = view as? UIStackView {
            stack.insertArrangedSubview(self, at: index)
        } else {
            view.insertSubview(self, at: index)
        }
        return self
    }

    @discardableResult
    @objc open func add(to view: UIView, above subview: UIView) -> Self {
        if let stack = view as? UIStackView,
           let aboveSubviewIndex = stack.arrangedSubviews
           .firstIndex(where: { $0 === subview })
        {
            stack.insertArrangedSubview(self, at: aboveSubviewIndex)
        } else {
            view.insertSubview(self, aboveSubview: subview)
        }
        return self
    }

    @discardableResult
    @objc open func add(to view: UIView, below subview: UIView) -> Self {
        if let stack = view as? UIStackView,
           let belowSubviewIndex = stack.arrangedSubviews
           .firstIndex(where: { $0 === subview })
        {
            stack.insertArrangedSubview(self, at: belowSubviewIndex + 1)
        } else {
            view.insertSubview(self, belowSubview: subview)
        }
        return self
    }

    @discardableResult
    @objc open func add(_ subView: UIView) -> Self {
        addSubview(subView)
        return self
    }

    @discardableResult
    @objc open func add(@UIViewBuilder subViews: () -> [UIView]) -> Self {
        subViews().forEach { addSubview($0) }
        return self
    }

    @discardableResult
    @objc open func removeSubViews() -> Self {
        subviews.forEach { $0.removeFromSuperview() }
        return self
    }

    @discardableResult
    @objc open func frame(_ rect: CGRect) -> Self {
        frame = rect
        return self
    }

    @discardableResult
    @objc open func frame(
        x: CGFloat,
        y: CGFloat,
        width: CGFloat,
        height: CGFloat
    ) -> Self {
        frame(CGRect(x: x, y: y, width: width, height: height))
    }

    @discardableResult
    public func frame(
        x: Double,
        y: Double,
        width: Double,
        height: Double
    ) -> Self {
        frame(CGRect(x: x, y: y, width: width, height: height))
    }

    @discardableResult
    public func frame(x: Int, y: Int, width: Int, height: Int) -> Self {
        frame(CGRect(x: x, y: y, width: width, height: height))
    }

    @discardableResult
    @objc open func frame(origin: CGPoint, size: CGSize) -> Self {
        frame(CGRect(origin: origin, size: size))
    }

    @discardableResult
    @objc open func offset(x: CGFloat, y: CGFloat) -> Self {
        offset(CGPoint(x: x, y: y))
    }

    @discardableResult
    @objc open func offset(_ point: CGPoint) -> Self {
        frame.origin = point
        return self
    }

    @available(iOS, deprecated: 13.0, renamed: "backgroundColor")
    @discardableResult
    @objc open func background(color: UIColor?) -> Self {
        backgroundColor = color
        return self
    }

    @discardableResult
    @objc open func backgroundColor(_ color: UIColor?) -> Self {
        backgroundColor = color
        return self
    }

    @discardableResult
    @objc open func background(_ view: UIView) -> Self {
        insertSubview(view, at: 0)
        view.fillSuperview()
        return self
    }

    @discardableResult
    public func background(_ view: @escaping () -> UIView) -> Self {
        background(view())
    }

    @available(iOS, deprecated: 13.0, renamed: "tintColor")
    @discardableResult
    @objc open func tint(color: UIColor) -> Self {
        tintColor = color
        return self
    }

    @discardableResult
    @objc open func tintColor(_ color: UIColor) -> Self {
        tintColor = color
        return self
    }

    @discardableResult
    @objc open func opacity(_ value: Double) -> Self {
        alpha = value
        return self
    }

    @discardableResult
    @objc open func semantic(_ semantic: UISemanticContentAttribute) -> Self {
        semanticContentAttribute = semantic
        return self
    }

    @available(iOS, deprecated: 13.0, renamed: "enabledUserInteraction")
    @discardableResult
    @objc open func userInteraction(enabled: Bool) -> Self {
        isUserInteractionEnabled = enabled
        return self
    }

    @discardableResult
    @objc open func enabledUserInteraction(_ enabled: Bool) -> Self {
        isUserInteractionEnabled = enabled
        return self
    }

    @available(iOS, deprecated: 13.0, renamed: "hidden")
    @discardableResult
    @objc open func hide(_ isHidden: Bool) -> Self {
        self.isHidden(isHidden)
        return self
    }

    @available(iOS, deprecated: 13.0, renamed: "hidden")
    @discardableResult
    @objc open func isHidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }

    @discardableResult
    @objc open func hidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }

    @discardableResult
    @objc open func clipBounds(_ isClipping: Bool = true) -> Self {
        clipsToBounds = isClipping
        return self
    }

    @discardableResult
    @objc open func isOpaque(_ isOpaque: Bool) -> Self {
        self.isOpaque = isOpaque
        return self
    }

    @discardableResult
    @objc open func autoresizingIntoConstraints(_ isEnabled: Bool) -> Self {
        translatesAutoresizingMaskIntoConstraints = isEnabled
        return self
    }

    @discardableResult
    @objc open func tintAdjustmentMode(
        _ mode: UIView
            .TintAdjustmentMode
    ) -> Self {
        tintAdjustmentMode = mode
        return self
    }

    @discardableResult
    @objc open func onTap(_ target: Any?, perform action: Selector) -> Self {
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(
            target: target,
            action: action
        ))
        return self
    }

    @discardableResult
    @objc open func onLongPress(
        _ target: Any?,
        perform action: Selector
    ) -> Self {
        isUserInteractionEnabled = true
        addGestureRecognizer(UILongPressGestureRecognizer(
            target: target,
            action: action
        ))
        return self
    }

    @discardableResult
    @objc open func onDrag(_ target: Any?, perform action: Selector) -> Self {
        isUserInteractionEnabled = true
        addGestureRecognizer(UIPanGestureRecognizer(
            target: target,
            action: action
        ))
        return self
    }

    @discardableResult
    @objc open func accessibilityIdentifier(_ id: String?) -> Self {
        accessibilityIdentifier = id
        return self
    }

    @discardableResult
    @objc open func restorationIdentifier(_ id: String?) -> Self {
        restorationIdentifier = id
        return self
    }
}
