//
//  HomeNetworking.swift
//  BenchHR
//
//  Created by ahmed moharam on 20/08/2024.
//

import Foundation
import Alamofire

enum HomeNetworking {
    case getForecast(latitude: String, longitude: String)
}

extension HomeNetworking: TargetType {
   
    var baseURL: String {
        Server.baseURL
    }
    
    var path: String {
        switch self {
            case .getForecast:
                return "forecast"
        }
    }
    
    var method: HTTPMethod {
        switch self {
            default:
                return .get
        }
    }
    
    var task: Task {
        switch self {
            case let .getForecast(lat, long):
                let params = ["latitude": lat,
                              "longitude": long,
                              "hourly": "temperature_2m,precipitation,weathercode",
                              "timezone": "auto"]
                return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? { 
        return [:]
    }
}
