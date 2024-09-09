//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UICollectionView {
    @discardableResult
    func register<Cell: UICollectionViewCell>(nib cell: Cell.Type) -> Self {
        register(cell.nib, forCellWithReuseIdentifier: cell.identifier)
        return self
    }

    @discardableResult
    func register<Cell: UICollectionViewCell>(class cell: Cell.Type) -> Self {
        register(cell, forCellWithReuseIdentifier: cell.identifier)
        return self
    }

    @discardableResult
    func register<ReusableView: UICollectionReusableView>(
        nib view: ReusableView.Type,
        of kind: ReusableViewKind
    ) -> Self {
        register(
            view.nib,
            forSupplementaryViewOfKind: kind.id,
            withReuseIdentifier: view.identifier
        )
        return self
    }

    @discardableResult
    func register<ReusableView: UICollectionReusableView>(
        class view: ReusableView.Type,
        of kind: ReusableViewKind
    ) -> Self {
        register(
            view,
            forSupplementaryViewOfKind: kind.id,
            withReuseIdentifier: view.identifier
        )
        return self
    }

    func dequeue<Cell: UICollectionViewCell>(at indexPath: IndexPath) -> Cell {
        let id = Cell.identifier
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: id,
            for: indexPath
        ) as? Cell
        else { fatalError("Cannot dequeue cell with identifier '\(id)'") }
        return cell
    }

    @discardableResult
    func dequeue<Cell: UICollectionViewCell>(
        at indexPath: IndexPath,
        onDequeue: @escaping (Cell) -> Void
    ) -> Self {
        let id = Cell.identifier
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: id,
            for: indexPath
        ) as? Cell
        else { fatalError("Cannot dequeue cell with identifier '\(id)'") }
        onDequeue(cell)
        return self
    }

    func dequeue<ReusableView: UICollectionReusableView>(
        _ kind: ReusableViewKind,
        for indexPath: IndexPath
    ) -> ReusableView {
        return dequeue(kind.id, for: indexPath)
    }

    func dequeue<ReusableView: UICollectionReusableView>(
        _ kind: String,
        for indexPath: IndexPath
    ) -> ReusableView {
        let id = ReusableView.identifier
        guard let view = dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: id,
            for: indexPath
        ) as? ReusableView
        else {
            fatalError(
                "Cannot dequeue reusable view of kind '\(kind)' with identifier '\(id)'"
            )
        }
        return view
    }

    @discardableResult
    func dequeue<ReusableView: UICollectionReusableView>(
        _ kind: ReusableViewKind,
        for indexPath: IndexPath,
        onDequeue: @escaping (ReusableView) -> Void
    ) -> Self {
        return dequeue(kind.id, for: indexPath, onDequeue: onDequeue)
    }

    @discardableResult
    func dequeue<ReusableView: UICollectionReusableView>(
        _ kind: String,
        for indexPath: IndexPath,
        onDequeue: @escaping (ReusableView) -> Void
    ) -> Self {
        let id = ReusableView.identifier
        guard let view = dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: id,
            for: indexPath
        ) as? ReusableView
        else {
            fatalError(
                "Cannot dequeue reusable view of kind '\(kind)' with identifier '\(id)'"
            )
        }
        onDequeue(view)
        return self
    }
}

public extension UICollectionView {
    enum ReusableViewKind {
        case header
        case footer

        var id: String {
            switch self {
            case .header: return UICollectionView.elementKindSectionHeader
            case .footer: return UICollectionView.elementKindSectionFooter
            }
        }

        public init?(_ kind: String) {
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                self = .header
            case UICollectionView.elementKindSectionFooter:
                self = .footer
            default: return nil
            }
        }
    }
}
