//
//  LocationsViewModel.swift
//  Seoudi Weather
//
//  Created by ahmed moharam on 09/09/2024.
//

import Foundation

protocol LocationsViewModelProtocol {
    
    var locationsList: ListValueSubject<LocationModel> { get }
}

class LocationsViewModel: LocationsViewModelProtocol {
    
    //MARK: - Propreties
    
    let locationsList = ListValueSubject<LocationModel>(LocationModel.locations)
    
    //MARK: - Methods
    
    private func setup() {
        setupUI()
    }
    
    private func setupUI() {
        
    }
}

