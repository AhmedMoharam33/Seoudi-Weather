//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UIView {
    @discardableResult
    private func updateUI() -> Self {
        return self
    }

    @discardableResult
    func corner(_ radius: CGFloat) -> Self {
        layer.cornerRadius = radius
        if radius > 0 {
            clipsToBounds = true
        }
        return updateUI()
    }

    @discardableResult
    func corner(_ radius: CGFloat, corners: UIRectCorner) -> Self {
        guard !corners.contains(.allCorners) else { return corner(radius) }
        if radius > 0 {
            layer.masksToBounds = true
        }
        layer.cornerRadius = radius
        layer.maskedCorners = corners.toCACornerMask()
        return updateUI()
    }

    @discardableResult
    func clipCircle() -> Self {
        let size = min(bounds.width, bounds.height)
        return corner(size / 2)
    }

    @discardableResult
    func border(_ color: UIColor, width: CGFloat = 1) -> Self {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        return updateUI()
    }

    @discardableResult
    func shadow(
        _ color: UIColor,
        radius: CGFloat = 1,
        opacity: Float = 1,
        x: CGFloat = 0,
        y: CGFloat = 0
    ) -> Self {
        if layer.cornerRadius > 0 {
            clipsToBounds = false
        }
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        return updateUI()
    }

    @discardableResult
    func blurBackground(_ style: UIBlurEffect.Style = .regular) -> Self {
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = frame
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurView)
        sendSubviewToBack(blurView)
        return self
    }
}
