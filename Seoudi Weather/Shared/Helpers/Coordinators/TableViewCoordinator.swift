//
//  TableViewCoordinator.swift
//  Seoudi Weather
//
//  Created by ahmed moharam on 30/08/2024.
//

import Foundation
import UIKit

class TableViewCoordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
    // MARK: - Private Properties
    
    private var numberOfSections: ((_ tableView: UITableView) -> Int)?
    private var numberOfRowsInSection: ((_ tableView: UITableView, _ section: Int) -> Int)?
    private var cellForRowAt: ((_ tableView: UITableView,_ indexPath: IndexPath) -> UITableViewCell)?
    private var heightForRowAt: ((_ tableView: UITableView,_ indexPath: IndexPath) -> CGFloat)?
    private var onDidSelectRow: ((_ tableView: UITableView,_ indexPath: IndexPath) -> Void)?
    
    // MARK: - Delegate Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        numberOfSections?(tableView) ?? 1
    }
    
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        numberOfRowsInSection?(tableView, section) ?? 0
    }
    
    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellForRowAt?(tableView, indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView,heightForRowAt indexPath: IndexPath) -> CGFloat {
        heightForRowAt?(tableView, indexPath) ?? UITableView
            .automaticDimension
    }
    
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        onDidSelectRow?(tableView, indexPath)
    }
    
    // MARK: - Modifiers
    
    @discardableResult
    public func numberOfSections(perform action: @escaping (_ tableView: UITableView)-> Int) -> Self {
        numberOfSections = action
        return self
    }
    
    @discardableResult
    public func numberOfRowsInSection(perform action: @escaping (_ tableView: UITableView,_ section: Int) -> Int) -> Self {
        numberOfRowsInSection = action
        return self
    }
    
    @discardableResult
    public func cellForRowAt(perform action: @escaping (
        _ tableView: UITableView,
        _ indexPath: IndexPath
    ) -> UITableViewCell) -> Self {
        cellForRowAt = action
        return self
    }
    
    @discardableResult
    public func heightForRowAt(perform action: @escaping (
        _ tableView: UITableView,
        _ indexPath: IndexPath
    ) -> CGFloat) -> Self {
        heightForRowAt = action
        return self
    }
    
    @discardableResult
    public func onDidSelectRow(perform action: @escaping (
        _ tableView: UITableView,
        _ indexPath: IndexPath
    ) -> Void) -> Self {
        onDidSelectRow = action
        return self
    }
}
