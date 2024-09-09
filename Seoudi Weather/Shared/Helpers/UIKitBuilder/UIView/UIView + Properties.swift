//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

extension UIView {
    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: "\(self)", bundle: nil) }
}
