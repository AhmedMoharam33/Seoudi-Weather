//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

// MARK: - Constraint

public extension UIView {
    @discardableResult
    func anchor(
        to layout: UILayoutGuide,
        padding: UIEdgeInsets = .zero,
        size: CGSize = .zero
    ) -> Self {
        anchor(
            top: layout.topAnchor,
            leading: layout.leadingAnchor,
            bottom: layout.bottomAnchor,
            trailing: layout.trailingAnchor,
            padding: padding,
            size: size
        )
    }

    @discardableResult
    func anchor(
        to view: UIView,
        padding: UIEdgeInsets = .zero,
        size: CGSize = .zero
    ) -> Self {
        anchor(
            top: view.topAnchor,
            leading: view.leadingAnchor,
            bottom: view.bottomAnchor,
            trailing: view.trailingAnchor,
            padding: padding,
            size: size
        )
    }

    @discardableResult
    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        padding: UIEdgeInsets = .zero,
        size: CGSize = .zero
    ) -> Self {
        updateConstraint(
            topAnchor,
            .top,
            equalTo: top,
            constant: padding.top
        )
        updateConstraint(
            leadingAnchor,
            .leading,
            equalTo: leading,
            constant: padding.left
        )
        updateConstraint(
            bottomAnchor,
            .bottom,
            equalTo: bottom,
            constant: -padding.bottom
        )
        updateConstraint(
            trailingAnchor,
            .trailing,
            equalTo: trailing,
            constant: -padding.right
        )
        updateNonZeroSize(size)
        return self
    }

    @discardableResult
    func fillSuperview(_ padding: UIEdgeInsets = .zero) -> Self {
        fillSuperview(inSafeArea: false, padding: padding)
    }

    @discardableResult
    func fillSuperview(inSafeArea: Bool, padding: CGFloat) -> Self {
        fillSuperview(
            inSafeArea: inSafeArea,
            padding: UIEdgeInsets(
                top: padding,
                left: padding,
                bottom: padding,
                right: padding
            )
        )
    }

    @discardableResult
    func fillSuperview(_ padding: CGFloat) -> Self {
        fillSuperview(UIEdgeInsets(
            top: padding,
            left: padding,
            bottom: padding,
            right: padding
        ))
    }

    @discardableResult
    func fillSuperview(
        inSafeArea: Bool,
        padding: UIEdgeInsets = .zero
    ) -> Self {
        guard let view = superview else { return self }
        let safeArea = view.safeAreaLayoutGuide
        updateConstraint(
            topAnchor,
            .top,
            equalTo: inSafeArea ? safeArea.topAnchor : view.topAnchor,
            constant: padding.top
        )
        updateConstraint(
            leadingAnchor,
            .leading,
            equalTo: inSafeArea ? safeArea.leadingAnchor : view.leadingAnchor,
            constant: padding.left
        )
        updateConstraint(
            bottomAnchor,
            .bottom,
            equalTo: inSafeArea ? safeArea.bottomAnchor : view.bottomAnchor,
            constant: -padding.bottom
        )
        updateConstraint(
            trailingAnchor,
            .trailing,
            equalTo: inSafeArea ? safeArea.trailingAnchor : view.trailingAnchor,
            constant: -padding.right
        )
        return self
    }

    @discardableResult
    func fillSuperview(
        safeArea edges: SafeAreaEdges,
        insets: UIEdgeInsets = .zero
    ) -> Self {
        guard let view = superview else { return self }
        guard !edges.isEmpty else {
            return fillSuperview(insets)
        }

        let safeArea = view.safeAreaLayoutGuide

        if edges.contains(.top) {
            updateConstraint(
                topAnchor,
                .top,
                equalTo: safeArea.topAnchor,
                constant: insets.top
            )
        } else {
            updateConstraint(
                topAnchor,
                .top,
                equalTo: view.topAnchor,
                constant: insets.top
            )
        }

        if edges.contains(.leading) {
            updateConstraint(
                leadingAnchor,
                .leading,
                equalTo: safeArea.leadingAnchor,
                constant: insets.left
            )
        } else {
            updateConstraint(
                leadingAnchor,
                .leading,
                equalTo: view.leadingAnchor,
                constant: insets.left
            )
        }

        if edges.contains(.bottom) {
            updateConstraint(
                bottomAnchor,
                .bottom,
                equalTo: safeArea.bottomAnchor,
                constant: -insets.bottom
            )
        } else {
            updateConstraint(
                bottomAnchor,
                .bottom,
                equalTo: view.bottomAnchor,
                constant: -insets.bottom
            )
        }

        if edges.contains(.trailing) {
            updateConstraint(
                trailingAnchor,
                .trailing,
                equalTo: safeArea.trailingAnchor,
                constant: -insets.right
            )
        } else {
            updateConstraint(
                trailingAnchor,
                .trailing,
                equalTo: view.trailingAnchor,
                constant: -insets.right
            )
        }

        return self
    }

    @discardableResult
    func centerInSuperview(
        _ size: CGSize = .zero,
        xConstant: CGFloat = 0,
        yConstant: CGFloat = 0
    ) -> Self {
        centerInSuperview(
            inSafeArea: false,
            size: size,
            xConstant: xConstant,
            yConstant: yConstant
        )
    }

    @discardableResult
    func centerInSuperview(
        inSafeArea: Bool,
        size: CGSize = .zero,
        xConstant: CGFloat = 0,
        yConstant: CGFloat = 0
    ) -> Self {
        centerXInSuperview(inSafeArea: inSafeArea, constant: xConstant)
        centerYInSuperview(inSafeArea: inSafeArea, constant: yConstant)
        updateNonZeroSize(size)
        return self
    }

    @discardableResult
    func centerXInSuperview(
        inSafeArea: Bool = false,
        constant: CGFloat = 0
    ) -> Self {
        guard let view = superview else { return self }
        let safeArea = view.safeAreaLayoutGuide
        updateConstraint(
            centerXAnchor,
            .centerX,
            equalTo: inSafeArea ? safeArea.centerXAnchor : view.centerXAnchor,
            constant: constant
        )
        return self
    }

    @discardableResult
    func centerYInSuperview(
        inSafeArea: Bool = false,
        constant: CGFloat = 0
    ) -> Self {
        guard let view = superview else { return self }
        let safeArea = view.safeAreaLayoutGuide
        updateConstraint(
            centerYAnchor,
            .centerY,
            equalTo: inSafeArea ? safeArea.centerYAnchor : view.centerYAnchor,
            constant: constant
        )
        return self
    }

    @discardableResult
    func width(_ constant: CGFloat) -> Self {
        updateDimension(widthAnchor, .width, constant: constant)
        return self
    }

    @discardableResult
    func width(
        relatedTo constraint: NSLayoutDimension,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1
    ) -> Self {
        updateDimension(
            widthAnchor,
            .width,
            constant: constant,
            relatedTo: constraint,
            multiplier: multiplier
        )
        return self
    }

    @discardableResult
    func height(_ constant: CGFloat) -> Self {
        updateDimension(heightAnchor, .height, constant: constant)
        return self
    }

    @discardableResult
    func height(
        relatedTo constraint: NSLayoutDimension,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1
    ) -> Self {
        updateDimension(
            heightAnchor,
            .height,
            constant: constant,
            relatedTo: constraint,
            multiplier: multiplier
        )
        return self
    }

    @discardableResult
    func size(width: CGFloat, height: CGFloat) -> Self {
        updateDimension(widthAnchor, .width, constant: width)
        updateDimension(heightAnchor, .height, constant: height)
        return self
    }

    @discardableResult
    func size(_ size: CGSize) -> Self {
        self.size(width: size.width, height: size.height)
    }

    @discardableResult
    func size(_ size: CGFloat) -> Self {
        self.size(width: size, height: size)
    }

    private func updateNonZeroSize(_ size: CGSize) {
        if size.width != 0 {
            width(size.width)
        }

        if size.height != 0 {
            height(size.height)
        }
    }

    private func updateConstraint<Anchor>(
        _ anchor: NSLayoutAnchor<Anchor>,
        _ attribute: NSLayoutConstraint.Attribute,
        equalTo secondAnchor: NSLayoutAnchor<Anchor>?,
        constant: CGFloat = 0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        guard let secondAnchor = secondAnchor else { return }
        if let constraint = constraints
            .first(where: { $0.firstAttribute == attribute
                    &&
                    (
                        $0.firstAnchor == secondAnchor || $0
                            .secondAnchor == secondAnchor
                    )
            }) ??
            superview?.constraints
            .first(where: { $0.firstAttribute == attribute &&
                    ($0.firstAnchor == anchor || $0.secondAnchor == anchor) &&
                    (
                        $0.firstAnchor == secondAnchor || $0
                            .secondAnchor == secondAnchor
                    )
            })
        {
            constraint.constant = constant
        } else {
            anchor.constraint(equalTo: secondAnchor, constant: constant)
                .isActive = true
        }
    }

    private func updateDimension(
        _ dimension: NSLayoutDimension,
        _ attribute: NSLayoutConstraint.Attribute,
        constant: CGFloat,
        relatedTo constraint: NSLayoutDimension? = nil,
        multiplier: CGFloat = 1
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        if let existConstraint = constraints
            .first(where: { $0.firstAttribute == attribute &&
                    (
                        $0.firstAnchor == dimension || $0
                            .secondAnchor == dimension
                    ) &&
                    (
                        $0.firstAnchor == constraint || $0
                            .secondAnchor == constraint
                    )
            })
        {
            existConstraint.isActive = false
        }

        if let constraint = constraint {
            dimension.constraint(
                equalTo: constraint,
                multiplier: multiplier,
                constant: constant
            ).isActive = true
        } else {
            dimension.constraint(equalToConstant: constant).isActive = true
        }
    }
}
