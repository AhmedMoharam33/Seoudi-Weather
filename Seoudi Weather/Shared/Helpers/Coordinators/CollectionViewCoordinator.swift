//
//  CollectionViewCoordinator.swift
//  Seoudi Weather
//
//  Created by ahmed moharam on 30/08/2024.
//

import Foundation
import UIKit

class CollectionViewCoordinator: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Private Properties
    
    private var numberOfSections: ((_ collectionView: UICollectionView) -> Int)?
    private var numberOfItemsInSection: ((_ collectionView: UICollectionView, _ section: Int) -> Int)?
    private var cellForItemAt: ((_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell)?
    private var sizeForItemAt: ((_ collectionView: UICollectionView, _ layout: UICollectionViewLayout, _ indexPath: IndexPath) -> CGSize)?
    private var minimumLineSpacingForSectionAt: ((_ collectionView: UICollectionView, _ layout: UICollectionViewLayout,_ section: Int) -> CGFloat)?
    private var minimumInteritemSpacingForSectionAt: ((_ collectionView: UICollectionView, _ layout: UICollectionViewLayout,_ section: Int) -> CGFloat)?
    private var didSelectItem: ((_ collectionView: UICollectionView, _ indexPath: IndexPath) -> Void)?
    
    // MARK: - Delegate Methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        numberOfSections?(collectionView) ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numberOfItemsInSection?(collectionView, section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cellForItemAt?(collectionView, indexPath) ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        sizeForItemAt?(collectionView, collectionViewLayout, indexPath) ?? CGSize(width: 100, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        minimumLineSpacingForSectionAt?(collectionView, collectionViewLayout, section) ??  0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        minimumInteritemSpacingForSectionAt?(collectionView, collectionViewLayout, section) ??  0
    }
    
    func collectionView(_ didSelectItemAt: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItem?(didSelectItemAt, indexPath)
    }
    
    // MARK: - Modifiers
    
    @discardableResult
    public func numberOfSections(perform action: @escaping (_ collectionView: UICollectionView) -> Int) -> Self {
        numberOfSections = action
        return self
    }
    
    @discardableResult
    public func numberOfItemsInSection(perform action: @escaping (_ collectionView: UICollectionView, _ section: Int) -> Int) -> Self {
        numberOfItemsInSection = action
        return self
    }
    
    @discardableResult
    public func cellForItemAt(perform action: @escaping (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell) -> Self {
        cellForItemAt = action
        return self
    }
    
    @discardableResult
    public func sizeForItemAt(perform action: @escaping (_ collectionView: UICollectionView, _ layout: UICollectionViewLayout, _ indexPath: IndexPath) -> CGSize) -> Self {
        sizeForItemAt = action
        return self
    }
    
    @discardableResult
    public func minimumLineSpacingForSectionAt(perform action: @escaping (_ collectionView: UICollectionView, _ layout: UICollectionViewLayout,_ section: Int) -> CGFloat) -> Self {
        minimumLineSpacingForSectionAt = action
        return self
    }
    
    @discardableResult
    public func minimumInteritemSpacingForSectionAt(perform action: @escaping (_ collectionView: UICollectionView, _ layout: UICollectionViewLayout,_ section: Int) -> CGFloat) -> Self {
        minimumInteritemSpacingForSectionAt = action
        return self
    }
    
    @discardableResult
    public func didSelectItem(perform action: @escaping (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> Void) -> Self {
        didSelectItem = action
        return self
    }
}
