//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UIButton {
    @discardableResult
    func text(_ string: String, for state: UIControl.State = .normal) -> Self {
        setTitle(string, for: state)
        return self
    }

    @discardableResult
    func textColor(_ color: UIColor, for state: UIControl.State) -> Self {
        setTitleColor(color, for: state)
        return self
    }

    @discardableResult
    func image(_ image: UIImage, for state: UIControl.State = .normal) -> Self {
        setImage(image, for: state)
        return self
    }

    @discardableResult
    func textInsets(_ insets: UIEdgeInsets) -> Self {
        titleEdgeInsets = insets
        return self
    }

    @discardableResult
    func textInsets(_ allEdges: CGFloat) -> Self {
        titleEdgeInsets = UIEdgeInsets(allEdges)
        return self
    }

    @discardableResult
    func textInsets(
        top: CGFloat? = nil,
        left: CGFloat? = nil,
        bottom: CGFloat? = nil,
        right: CGFloat? = nil
    ) -> Self {
        var edges = titleEdgeInsets
        if let top = top {
            edges.top = top
        }
        if let bottom = bottom {
            edges.bottom = bottom
        }
        if let right = right {
            edges.right = right
        }
        if let left = left {
            edges.left = left
        }
        titleEdgeInsets = edges
        return self
    }

    @discardableResult
    func imageInsets(_ insets: UIEdgeInsets) -> Self {
        imageEdgeInsets = insets
        return self
    }

    @discardableResult
    func imageInsets(_ allEdges: CGFloat) -> Self {
        imageEdgeInsets = UIEdgeInsets(allEdges)
        return self
    }

    @discardableResult
    func imageInsets(
        top: CGFloat? = nil,
        left: CGFloat? = nil,
        bottom: CGFloat? = nil,
        right: CGFloat? = nil
    ) -> Self {
        var edges = imageEdgeInsets
        if let top = top {
            edges.top = top
        }
        if let bottom = bottom {
            edges.bottom = bottom
        }
        if let right = right {
            edges.right = right
        }
        if let left = left {
            edges.left = left
        }
        imageEdgeInsets = edges
        return self
    }

    @discardableResult
    func adjustTitleWithImage(
        _ axis: NSLayoutConstraint.Axis,
        spacing: CGFloat = 5.0
    ) -> Self {
        let imageSize = imageView?.frame.size ?? .zero
        let titleSize = titleLabel?.frame.size ?? .zero
        let titleInset: UIEdgeInsets
        let imageInset: UIEdgeInsets

        switch axis {
        case .vertical:
            titleInset = UIEdgeInsets(
                top: 0,
                left: -imageSize.width,
                bottom: -(imageSize.height + spacing),
                right: 0
            )
            imageInset = UIEdgeInsets(
                top: -(titleSize.height + spacing),
                left: 0,
                bottom: 0,
                right: -titleSize.width
            )

        case .horizontal:
            titleInset = UIEdgeInsets(
                top: 0,
                left: -imageSize.width,
                bottom: -(imageSize.height + spacing),
                right: 0
            )
            imageInset = UIEdgeInsets(
                top: -(titleSize.height + spacing),
                left: 0,
                bottom: 0,
                right: -titleSize.width
            )

        default:
            titleInset = .zero
            imageInset = .zero
        }

        titleEdgeInsets = titleInset
        imageEdgeInsets = imageInset
        return self
    }
}
