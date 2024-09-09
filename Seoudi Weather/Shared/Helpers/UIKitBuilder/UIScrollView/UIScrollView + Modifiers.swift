//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

extension UICollectionViewFlowLayout {
    @discardableResult
    public func minimumInteritemSpacing(_ value: CGFloat) -> Self {
        minimumInteritemSpacing = value
        return self
    }
    
    @discardableResult
    public func minimumLineSpacing(_ value: CGFloat) -> Self {
        minimumLineSpacing = value
        return self
    }
    
    @discardableResult
    func scrollDirection(_ value: UICollectionView.ScrollDirection) -> Self {
        self.scrollDirection = value
        return self
    }
    
}

extension UIScrollView {
    
    @discardableResult
    @objc open func showScrollIndicator(_ state: Bool) -> Self {
        showsVerticalScrollIndicator = state
        showsHorizontalScrollIndicator = state
        return self
    }

    @discardableResult
    @objc open func lockDirection(_ locked: Bool) -> Self {
        isDirectionalLockEnabled = locked
        return self
    }

    @discardableResult
    @objc open func bounces(_ enabled: Bool) -> Self {
        bounces = enabled
        return self
    }

    @discardableResult
    @objc open func alwaysBounce(_ enabled: Bool) -> Self {
        alwaysBounceVertical = enabled
        alwaysBounceHorizontal = enabled
        return self
    }

    @discardableResult
    @objc open func paging(_ enabled: Bool) -> Self {
        isPagingEnabled = enabled
        return self
    }

    @discardableResult
    @objc open func scrolling(_ enabled: Bool) -> Self {
        isScrollEnabled = enabled
        return self
    }

    @available(iOS, deprecated: 13.0, renamed: "keyboardDismiss")
    @discardableResult
    @objc open func keyboard(
        dismiss mode: UIScrollView
            .KeyboardDismissMode
    ) -> Self {
        keyboardDismissMode = mode
        return self
    }

    @discardableResult
    @objc open func keyboardDismiss(
        _ mode: UIScrollView
            .KeyboardDismissMode
    ) -> Self {
        keyboardDismissMode = mode
        return self
    }

    @discardableResult
    @objc open func scrollsToTop(_ enabled: Bool) -> Self {
        scrollsToTop = enabled
        return self
    }

    @discardableResult
    @objc open func adjustmentBehavior(
        _ behavior: UIScrollView
            .ContentInsetAdjustmentBehavior
    ) -> Self {
        contentInsetAdjustmentBehavior = behavior
        return self
    }

    @discardableResult
    @objc open func contentOffset(
        _ offset: CGPoint,
        animated: Bool = false
    ) -> Self {
        setContentOffset(offset, animated: animated)
        return self
    }

    @discardableResult
    @objc open func contentSize(_ size: CGSize) -> Self {
        contentSize = size
        return self
    }

    @discardableResult
    @objc open func contentInsets(_ inset: UIEdgeInsets) -> Self {
        contentInset = inset
        return self
    }

    @discardableResult
    public func contentInsets(
        top: CGFloat? = nil,
        left: CGFloat? = nil,
        bottom: CGFloat? = nil,
        right: CGFloat? = nil
    ) -> Self {
        if let top = top {
            contentInset.top = top
        }
        if let left = left {
            contentInset.left = left
        }
        if let bottom = bottom {
            contentInset.bottom = bottom
        }
        if let right = right {
            contentInset.right = right
        }
        return self
    }
}
