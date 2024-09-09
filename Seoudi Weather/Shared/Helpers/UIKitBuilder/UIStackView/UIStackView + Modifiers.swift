//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UIStackView {
    convenience init(frame: CGRect, @UIViewBuilder subViews: () -> [UIView]) {
        self.init(frame: frame)
        subViews().forEach { addArrangedSubview($0) }
    }
}

public extension UIStackView {
    @discardableResult
    override func add(_ subView: UIView) -> Self {
        addArrangedSubview(subView)
        return self
    }

    @discardableResult
    func add(_ subViews: [UIView]) -> Self {
        subViews.forEach { addArrangedSubview($0) }
        return self
    }

    @discardableResult
    override func removeSubViews() -> Self {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
        return self
    }

    @discardableResult
    override func add(@UIViewBuilder subViews: () -> [UIView]) -> Self {
        subViews().forEach { addArrangedSubview($0) }
        return self
    }

    @discardableResult
    func axis(_ direction: NSLayoutConstraint.Axis) -> Self {
        axis = direction
        return self
    }

    @discardableResult
    func distribution(_ type: Distribution) -> Self {
        distribution = type
        return self
    }

    @discardableResult
    func alignment(_ type: Alignment) -> Self {
        alignment = type
        return self
    }

    @discardableResult
    func spacing(_ value: CGFloat) -> Self {
        spacing = value
        return self
    }
}
