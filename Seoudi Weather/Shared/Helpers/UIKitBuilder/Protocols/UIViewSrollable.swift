//
// BenchHR
//
// Created by ahmed moharam.

import Foundation
import UIKit

public protocol UIViewSrollable: AnyObject { }

extension UIScrollView: UIViewSrollable { }

public extension UIViewSrollable where Self: UIScrollView {
    @discardableResult
    func showScrollIndicator(_ state: Bool) -> Self {
        showsVerticalScrollIndicator = state
        showsHorizontalScrollIndicator = state
        return self
    }

    @discardableResult
    func lockDirection(_ locked: Bool) -> Self {
        isDirectionalLockEnabled = locked
        return self
    }

    @discardableResult
    func bounces(_ enabled: Bool) -> Self {
        bounces = enabled
        return self
    }

    @discardableResult
    func alwaysBounce(_ enabled: Bool) -> Self {
        alwaysBounceVertical = enabled
        alwaysBounceHorizontal = enabled
        return self
    }

    @discardableResult
    func paging(_ enabled: Bool) -> Self {
        isPagingEnabled = enabled
        return self
    }

    @discardableResult
    func scrolling(_ enabled: Bool) -> Self {
        isScrollEnabled = enabled
        return self
    }

    @available(iOS, deprecated: 13.0, renamed: "keyboardDismiss")
    @discardableResult
    func keyboard(dismiss mode: UIScrollView.KeyboardDismissMode) -> Self {
        keyboardDismissMode = mode
        return self
    }

    @discardableResult
    func keyboardDismiss(_ mode: UIScrollView.KeyboardDismissMode) -> Self {
        keyboardDismissMode = mode
        return self
    }

    @discardableResult
    func indicatorStyle(_ style: UIScrollView.IndicatorStyle) -> Self {
        indicatorStyle = style
        return self
    }

    @discardableResult
    func onPullToRefresh(perform action: Selector) -> Self {
        createRfreshControlIfNeeded()
        refreshControl?.addTarget(nil, action: action, for: .valueChanged)
        return self
    }

    @discardableResult
    func refreshControl(tintColor: UIColor) -> Self {
        createRfreshControlIfNeeded()
        refreshControl?.tintColor = tintColor
        return self
    }

    @discardableResult
    func isRefreshing(_ isRefreshing: Bool) -> Self {
        isRefreshing ? refreshControl?.beginRefreshing() : refreshControl?.endRefreshing()
        return self
    }

    private func createRfreshControlIfNeeded() {
        guard refreshControl == nil else { return }
        refreshControl = UIRefreshControl()
    }
}
