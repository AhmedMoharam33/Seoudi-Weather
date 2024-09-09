//
// BenchHR
//
// Created by ahmed moharam.

import Foundation

import UIKit

public protocol UIImageEditable: AnyObject {
    var image: UIImage? { get set }
    var contentMode: UIView.ContentMode { get set }
}

public extension UIImageEditable {
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }

    @discardableResult
    func image(name: String) -> Self {
        return image(UIImage(named: name))
    }

    @discardableResult
    func renderingMode(_ mode: UIImage.RenderingMode) -> Self {
        image = image?.withRenderingMode(mode)
        return self
    }

    @available(iOS, deprecated: 13.0, renamed: "contentMode")
    @discardableResult
    func content(mode: UIView.ContentMode) -> Self {
        contentMode = mode
        return self
    }

    @discardableResult
    func contentMode(_ mode: UIView.ContentMode) -> Self {
        contentMode = mode
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func image(systemName: String) -> Self {
        image = UIImage(systemName: systemName)
        return self
    }
}
