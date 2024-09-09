//
//  String + Convert Date Format.swift
//  Seoudi Weather
//
//  Created by ahmed moharam on 09/09/2024.
//

import Foundation

extension String {
    func to12HourTimeFormat() -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        inputFormatter.timeZone = TimeZone.current

        guard let date = inputFormatter.date(from: self) else {
            return nil
        }
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "h a"

        return outputFormatter.string(from: date)
    }
}
