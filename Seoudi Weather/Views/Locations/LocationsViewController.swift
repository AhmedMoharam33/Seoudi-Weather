//
//  LocationsViewController.swift
//  Seoudi Weather
//
//  Created by ahmed moharam on 09/09/2024.
//

import UIKit

class LocationsViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Propreties
    
    private let tableViewCoordinatorProvider = TableViewCoordinator()
    private let viewModel: LocationsViewModelProtocol
    
    //MARK: - Computed Propreties
    
    var data: [LocationModel]? {
        viewModel.locationsList.value
    }
    
    //MARK: - Init
    
    init(viewModel: LocationsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfiguration()
    }
    
    //MARK: - Methods
    
    private func tableViewConfiguration() {
        if #available(iOS 15.0, *) { tableView.sectionHeaderTopPadding = 0.0 }
        
        tableView
            .register(nib: LocationsTableCell.self)
            .delegate(tableViewCoordinatorProvider)
            .dataSource(tableViewCoordinatorProvider)
            .showScrollIndicator(false)
            .backgroundColor(.clear)
            .separatorStyle = .none
        
        tableViewCoordinatorProvider
            .numberOfRowsInSection { [weak self] _, _ in
                guard let self else { return 0 }
                
                return data?.count ?? 0
            }.cellForRowAt { [weak self] tableView, indexPath in
                guard let self,
                      let cell = tableView.dequeueReusableCell(withIdentifier: "\(LocationsTableCell.self)", for: indexPath) as? LocationsTableCell
                else { return UITableViewCell() }
                
                cell.config(data: data?[indexPath.row])
                return cell
            }.heightForRowAt { _, _ in
                180
            }.onDidSelectRow { [weak self] tableView, indexPath in
                guard let self else { return }
                
                AppStateManager.shared.switchState(to: .weather(data?[indexPath.row]))
            }
    }
}
