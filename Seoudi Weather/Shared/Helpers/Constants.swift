//
//  Constants.swift
//  Seoudi Weather
//
//  Created by ahmed moharam on 30/08/2024.
//

import Foundation

enum Server {
    static var baseURL: String = "https://api.open-meteo.com/v1/"
}

enum HTTPCode {
    static let notFound404 = 404
    static let unauthorized401 = 401
    static let unprocessableEntity422 = 422
}

enum ErrorDomain {
    static let http = ""
    static let connection = ""
    static let server = ""
}

enum Message {
    static let HTTPToken = "You entered a wrong HTTPToken."
    static let genericError = "Some thing went wrong, please try again later."
}

enum AppData: String {
    case appName = "Seoudi Weather"
}
