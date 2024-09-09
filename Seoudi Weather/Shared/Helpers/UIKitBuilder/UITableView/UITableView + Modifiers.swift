//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UITableView {
    @discardableResult
    func delegate(_ delegate: UITableViewDelegate) -> Self {
        self.delegate = delegate
        return self
    }

    @discardableResult
    func dataSource(_ dataSource: UITableViewDataSource) -> Self {
        self.dataSource = dataSource
        return self
    }
}

public extension UITableView {
    @discardableResult
    func sectionHeaderTopPadding(_ value: CGFloat) -> Self {
        if #available(iOS 15.0, *) {
            sectionHeaderTopPadding = value
        }
        return self
    }

    @discardableResult
    func footerView(_ view: UIView) -> Self {
        tableFooterView = view
        return self
    }

    @discardableResult
    func footerView(_ view: @escaping () -> UIView) -> Self {
        tableFooterView = view()
        return self
    }
}
