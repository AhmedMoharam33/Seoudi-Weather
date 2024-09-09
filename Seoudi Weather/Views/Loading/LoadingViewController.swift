//
//  LoadingViewController.swift
//  Seoudi Weather
//
//  Created by ahmed moharam on 30/08/2024.
//

import UIKit

class LoadingViewController: UIViewController {

    
    //MARK: - Outlets
    
    //MARK: - Propreties
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Methods

    private func setupUI() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            AppStateManager.shared.switchState(to: .location)
        }
    }
}
