//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UIView {
    // MARK: Hugging Priority

    @discardableResult
    func huggingPriority(
        _ priority: UILayoutPriority,
        for axis: NSLayoutConstraint.Axis
    ) -> Self {
        setContentHuggingPriority(priority, for: axis)
        return self
    }

    @discardableResult
    func huggingPriority(
        vertical: UILayoutPriority,
        horizontal: UILayoutPriority
    ) -> Self {
        setContentHuggingPriority(vertical, for: .vertical)
        setContentHuggingPriority(horizontal, for: .horizontal)
        return self
    }

    @discardableResult
    func huggingPriority(vertical: Float, horizontal: Float) -> Self {
        huggingPriority(
            vertical: UILayoutPriority(vertical),
            horizontal: UILayoutPriority(horizontal)
        )
    }

    @discardableResult
    func huggingPriority(
        _ priority: Float,
        for axis: NSLayoutConstraint.Axis
    ) -> Self {
        huggingPriority(UILayoutPriority(priority), for: axis)
    }

    @discardableResult
    func huggingHPriority(_ priority: UILayoutPriority) -> Self {
        huggingPriority(priority, for: .horizontal)
    }

    @discardableResult
    func huggingHPriority(_ priority: Float) -> Self {
        huggingPriority(priority, for: .horizontal)
    }

    @discardableResult
    func huggingVPriority(_ priority: UILayoutPriority) -> Self {
        huggingPriority(priority, for: .vertical)
    }

    @discardableResult
    func huggingVPriority(_ priority: Float) -> Self {
        huggingPriority(priority, for: .vertical)
    }

    // MARK: Compression Resistance Priority

    @discardableResult
    func compressionPriority(
        _ priority: UILayoutPriority,
        for axis: NSLayoutConstraint.Axis
    ) -> Self {
        setContentCompressionResistancePriority(priority, for: axis)
        return self
    }

    @discardableResult
    func compressionPriority(
        vertical: UILayoutPriority,
        horizontal: UILayoutPriority
    ) -> Self {
        setContentCompressionResistancePriority(vertical, for: .vertical)
        setContentCompressionResistancePriority(horizontal, for: .horizontal)
        return self
    }

    @discardableResult
    func compressionPriority(vertical: Float, horizontal: Float) -> Self {
        compressionPriority(
            vertical: UILayoutPriority(vertical),
            horizontal: UILayoutPriority(horizontal)
        )
    }

    @discardableResult
    func compressionPriority(
        _ priority: Float,
        for axis: NSLayoutConstraint.Axis
    ) -> Self {
        compressionPriority(UILayoutPriority(priority), for: axis)
    }

    @discardableResult
    func compressionHPriority(_ priority: UILayoutPriority) -> Self {
        compressionPriority(priority, for: .horizontal)
    }

    @discardableResult
    func compressionHPriority(_ priority: Float) -> Self {
        compressionPriority(priority, for: .horizontal)
    }

    @discardableResult
    func compressionVPriority(_ priority: UILayoutPriority) -> Self {
        compressionPriority(priority, for: .vertical)
    }

    @discardableResult
    func compressionVPriority(_ priority: Float) -> Self {
        compressionPriority(priority, for: .vertical)
    }
}
