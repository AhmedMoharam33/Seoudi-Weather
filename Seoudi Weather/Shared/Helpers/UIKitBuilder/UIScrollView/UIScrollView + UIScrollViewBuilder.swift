//
// BenchHR
//
// Created by ahmed moharam.

////
////  UIScrollView + UIScrollViewBuilder.swift
////  BenchHR
////
////  Created by ahmed moharam on 07/08/2024.
////
//
// import UIKit
//
// public extension UIScrollViewBuilder where Self == UIScrollView {
//    init(_ axis: NSLayoutConstraint.Axis = .vertical,
//         spacing: CGFloat = 0,
//         alignment: UIStackView.Alignment = .fill,
//         distribution: UIStackView.Distribution = .fill,
//         @UIViewBuilder content: () -> [UIView])
//    {
//        self.init(frame: .zero)
//
//        let view = UIView()
//            .add(to: self)
//            .anchor(to: contentLayoutGuide)
//
//        switch axis {
//        case .horizontal:
//            view.height(relatedTo: frameLayoutGuide.heightAnchor)
//
//        case .vertical:
//            view.width(relatedTo: frameLayoutGuide.widthAnchor)
//
//        default: break
//        }
//
//        UIStackView(axis, spacing: spacing,
//                    alignment: alignment,
//                    distribution: distribution,
//                    content: content)
//            .add(to: view)
//            .fillSuperview()
//    }
// }
//
// extension UIScrollView: UIScrollViewBuilder {
//    fileprivate var containerView: UIView? { subviews.first }
//    fileprivate var containerStackView: UIStackView? {
//    subviews.first?.subviews.first as? UIStackView }
// }
//
// public extension UIScrollViewBuilder where Self == UIScrollView {
//    @discardableResult
//    func axis(_ direction: NSLayoutConstraint.Axis) -> Self {
//        containerStackView?.axis = direction
//        return self
//    }
//
//    @discardableResult
//    func distribution(_ type: UIStackView.Distribution) -> Self {
//        containerStackView?.distribution = type
//        return self
//    }
//
//    @discardableResult
//    func alignment(_ type: UIStackView.Alignment) -> Self {
//        containerStackView?.alignment = type
//        return self
//    }
//
//    @discardableResult
//    func spacing(_ value: CGFloat) -> Self {
//        containerStackView?.spacing = value
//        return self
//    }
//
//    @discardableResult
//    func padding(_ value: CGFloat) -> Self {
//        padding(top: value, leading: value, bottom: value, trailing: value)
//    }
//
//    @discardableResult
//    func padding(top: CGFloat? = nil, leading: CGFloat? = nil, bottom:
//    CGFloat? = nil, trailing: CGFloat? = nil) -> Self {
//        guard let stack = containerStackView, let container = containerView
//        else { return self }
//        let constraints = container.constraints
//
//        if let top = top, let constraint = constraints.first(where: {
//            $0.firstAttribute == .top &&
//                $0.firstAnchor == stack.topAnchor
//        }) {
//            constraint.constant = top
//        }
//
//        if let bottom = bottom, let constraint = constraints.first(where: {
//            $0.firstAttribute == .bottom &&
//                $0.firstAnchor == stack.bottomAnchor
//        }) {
//            constraint.constant = -bottom
//        }
//
//        if let leading = leading, let constraint = constraints.first(where: {
//            $0.firstAttribute == .leading &&
//                $0.firstAnchor == stack.leadingAnchor
//        }) {
//            constraint.constant = leading
//        }
//
//        if let trailing = trailing, let constraint = constraints.first(where:
//        {
//            $0.firstAttribute == .trailing &&
//                $0.firstAnchor == stack.trailingAnchor
//        }) {
//            constraint.constant = -trailing
//        }
//
//        stack.updateConstraints()
//        return self
//    }
//
//    @discardableResult
//    func add(@UIViewBuilder subViews: @escaping () -> [UIView]) -> Self {
//        containerStackView?.add(subViews())
//        return self
//    }
//
//    @discardableResult
//    func hideContent(_ isHidden: Bool = true) -> Self {
//        guard let container = containerView else {
//            return hidden(isHidden)
//        }
//
//        container.hidden(isHidden)
//        return self
//    }
// }
