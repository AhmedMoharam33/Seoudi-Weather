//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UIButton {
    internal var image: UIImage? {
        get { image(for: .normal) }
        set { setImage(newValue, for: .normal) }
    }

    @discardableResult
    func content(mode: UIView.ContentMode) -> Self {
        imageView?.contentMode = mode
        return self
    }

    @discardableResult
    func image(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }

    @discardableResult
    func image(_ image: UIImage?, state: UIControl.State) -> Self {
        setImage(image, for: state)
        return self
    }

    @discardableResult
    func image(name: String) -> Self {
        return image(UIImage(named: name))
    }

    @discardableResult
    func image(name: String, state: UIControl.State) -> Self {
        setImage(UIImage(named: name), for: state)
        return self
    }

    @discardableResult
    func renderingMode(_ mode: UIImage.RenderingMode) -> Self {
        image = image?.withRenderingMode(mode)
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func image(systemName: String) -> Self {
        image = UIImage(systemName: systemName)
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func image(systemName: String, state: UIControl.State) -> Self {
        setImage(UIImage(systemName: systemName), for: state)
        return self
    }
}
