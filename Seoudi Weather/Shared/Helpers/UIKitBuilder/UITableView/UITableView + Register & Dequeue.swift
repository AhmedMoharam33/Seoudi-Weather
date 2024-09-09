//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UITableView {
    @discardableResult
    func register<Cell: UITableViewCell>(nib cell: Cell.Type) -> Self {
        register(cell.nib, forCellReuseIdentifier: cell.identifier)
        return self
    }

    @discardableResult
    func register<Cell: UITableViewCell>(class cell: Cell.Type) -> Self {
        register(cell, forCellReuseIdentifier: cell.identifier)
        return self
    }

    @discardableResult
    func register<View: UITableViewHeaderFooterView>(
        class headerFooter: View
            .Type
    ) -> Self {
        register(
            headerFooter,
            forHeaderFooterViewReuseIdentifier: headerFooter.identifier
        )
        return self
    }

    @discardableResult
    func register<View: UITableViewHeaderFooterView>(
        nib headerFooter: View
            .Type
    ) -> Self {
        register(
            headerFooter.nib,
            forHeaderFooterViewReuseIdentifier: headerFooter.identifier
        )
        return self
    }

    func dequeue<Cell: UITableViewCell>() -> Cell {
        let id = Cell.identifier
        guard let cell = dequeueReusableCell(withIdentifier: id) as? Cell
        else { fatalError("Cannot dequeue cell with identifier '\(id)'") }
        return cell
    }

    @discardableResult
    func dequeue<Cell: UITableViewCell>(_ onDequeue: @escaping (Cell) -> Void)
        -> Self
    {
        let id = Cell.identifier
        guard let cell = dequeueReusableCell(withIdentifier: id) as? Cell
        else { fatalError("Cannot dequeue cell with identifier '\(id)'") }
        onDequeue(cell)
        return self
    }

    func dequeue<HeaderFooter: UITableViewHeaderFooterView>() -> HeaderFooter {
        let id = HeaderFooter.identifier
        guard let view =
            dequeueReusableHeaderFooterView(withIdentifier: id) as? HeaderFooter
        else {
            fatalError("Cannot dequeue header/footer with identifier '\(id)'")
        }
        return view
    }

    @discardableResult
    func dequeue<HeaderFooter: UITableViewHeaderFooterView>(
        _ onDequeue: @escaping (HeaderFooter)
            -> Void
    ) -> Self {
        let id = HeaderFooter.identifier
        guard let view =
            dequeueReusableHeaderFooterView(withIdentifier: id) as? HeaderFooter
        else {
            fatalError("Cannot dequeue header/footer with identifier '\(id)'")
        }
        onDequeue(view)
        return self
    }
}
