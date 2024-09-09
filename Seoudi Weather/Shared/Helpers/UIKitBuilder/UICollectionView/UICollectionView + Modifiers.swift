//
// BenchHR
//
// Created by ahmed moharam.

import UIKit

public extension UICollectionView {
    
    @discardableResult
    func translatesAutoresizingMaskIntoConstraints(_ value: Bool) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = value
        return self
    }
    
    @discardableResult
    func delegate(_ delegate: UICollectionViewDelegate) -> Self {
        self.delegate = delegate
        return self
    }
    
    @discardableResult
    func collectionViewLayout(_ value: UICollectionViewFlowLayout) -> Self {
        collectionViewLayout = value
        return self
    }
    
    @discardableResult
    func delegate(
        _ delegate: UICollectionViewDelegate &
            UICollectionViewDelegateFlowLayout
    ) -> Self {
        self.delegate = delegate
        return self
    }

    @discardableResult
    func dataSource(_ dataSource: UICollectionViewDataSource) -> Self {
        self.dataSource = dataSource
        return self
    }
}
