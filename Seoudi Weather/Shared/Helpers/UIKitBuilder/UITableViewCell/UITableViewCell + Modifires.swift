//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UITableViewCell {
    static func dequeue(from tableView: UITableView) -> Self {
        tableView.dequeueReusableCell(withIdentifier: "\(Self.self)") as! Self
    }
}
