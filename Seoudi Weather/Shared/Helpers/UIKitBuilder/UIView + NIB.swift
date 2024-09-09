//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UIView {
    func loadSelfFromNib() {
        let bundle = Bundle(for: Self.self)
        let nib = UINib(nibName: "\(Self.self)", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil)
            .first as? UIView else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}

public extension UIView {
    class func loadFromNib() -> Self {
        Bundle(for: Self.self).loadNibNamed(
            String(describing: Self.self),
            owner: nil,
            options: nil
        )!.first as! Self
    }
}
