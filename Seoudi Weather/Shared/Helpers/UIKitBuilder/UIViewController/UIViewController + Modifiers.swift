//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UIViewController {
    @discardableResult
    func tabBarItem(_ tabBarItem: UITabBarItem) -> Self {
        self.tabBarItem = tabBarItem
        return self
    }

    @discardableResult
    func tabBarItem(
        _ title: String,
        image: UIImage?,
        selectedImage: UIImage?
    ) -> Self {
        tabBarItem = UITabBarItem(
            title: title,
            image: image,
            selectedImage: selectedImage
        )
        return self
    }

    @discardableResult
    func tabBarItem(image: UIImage, selectedImage: UIImage) -> Self {
        tabBarItem = UITabBarItem(
            title: nil,
            image: image,
            selectedImage: selectedImage
        )
        return self
    }
}

public extension UIViewController {
    @discardableResult
    func transitionStyle(_ style: UIModalTransitionStyle) -> Self {
        modalTransitionStyle = style
        return self
    }

    @discardableResult
    func presentationStyle(_ style: UIModalPresentationStyle) -> Self {
        modalPresentationStyle = style
        return self
    }

    func presentOn(
        _ viewController: UIViewController,
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        viewController.present(self, animated: animated, completion: completion)
    }
}

public extension UIViewController {
    @discardableResult
    func addChildView(
        _ child: UIViewController,
        containerView: UIView? = nil,
        padding: UIEdgeInsets = .zero
    ) -> Self {
        let container: UIView = containerView ?? view
        addChild(child)
        child.view
            .add(to: container)
            .fillSuperview(padding)
        child.didMove(toParent: self)
        return self
    }
}
