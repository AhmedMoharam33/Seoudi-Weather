//
// Seoudi Weather
//
// Created by ahmed moharam.

import Foundation

public class ErrorResponse: Decodable, Error {
    var statusCode: Int?
    var message: String?
}
