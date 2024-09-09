//
//  HomeProvider.swift
//  BenchHR
//
//  Created by ahmed moharam on 20/08/2024.
//

import Combine
import Foundation

protocol HomeProviderProtocol {
    func getForecast(latitude: String, longitude: String) -> AnyPublisher<BaseModel, NSError>
}

class HomeProvider: BaseAPI<HomeNetworking>, HomeProviderProtocol {
 
    func getForecast(latitude: String, longitude: String) -> AnyPublisher<BaseModel, NSError> {
        fetchData(target: .getForecast(latitude: latitude, longitude: longitude))
    }
}


