//
// Seoudi Weather
//
// Created by ahmed moharam.

import Foundation

struct BaseModel: Codable {
    let latitude: Double?
    let longitude: Double?
    let generationTimeMS: Double?
    let UTCOffsetSeconds: Double?
    let timeZoneAbbreviation: String?
    let timezone: String?
    let elevation: Double?
    let hourly: Hourly?
    
    enum CodingKeys: String, CodingKey {
        case UTCOffsetSeconds = "utc_offset_seconds"
        case timeZoneAbbreviation = "timezone_abbreviatio"
        case generationTimeMS = "generationtime_ms"
        case latitude, longitude, timezone, elevation, hourly
    }
}

struct Hourly: Codable {
    let time: [String]?
    let temperature2M: [Double]?
    let precipitation: [Double]?
    let weatherCode: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case temperature2M = "temperature_2m"
        case time, precipitation
        case weatherCode = "weathercode"
    }
    
    private func getCurrentHourISO8601() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:00"
        return dateFormatter.string(from: Date())
    }
    
    // Function to get data for the current hour, including AM/PM indicator
    func getCurrentHourData() -> (time: String?, temperature2M: Double?, precipitation: Double?, weatherCode: Int?, isAM: Bool) {
        let currentHourISO8601 = getCurrentHourISO8601()
        
        guard let time = time,
              let index = time.firstIndex(of: currentHourISO8601) else {
            return (nil, nil, nil, nil, isSunRisen())
        }
        
        // Ensure that the index is valid for all arrays
        let temperature = index < (temperature2M?.count ?? 0) ? temperature2M?[index] : nil
        let precip = index < (precipitation?.count ?? 0) ? precipitation?[index] : nil
        let weather = index < (weatherCode?.count ?? 0) ? weatherCode?[index] : nil
        
        return (time[index], temperature, precip, weather, isSunRisen())
    }
    
    private func isSunRisen() -> Bool {
        return Calendar.current.component(.hour, from: Date()) >= 6
    }
    
    private func formatDate(_ dateString: String) -> String? {
        let isoDateFormatter = DateFormatter()
        isoDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        guard let date = isoDateFormatter.date(from: dateString) else { return nil }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "h a" // "2 PM"
        return outputFormatter.string(from: date)
    }
    
    func filterUniqueTimes() -> Hourly {
        guard let time = time else { return self }
        
        var uniqueTimeDict = [String: (String, Double?, Double?, Int?)]()
        
        for index in 0..<time.count {
            guard let formattedTime = formatDate(time[index]) else { continue }
            
            let temperature = index < (temperature2M?.count ?? 0) ? temperature2M?[index] : nil
            let precip = index < (precipitation?.count ?? 0) ? precipitation?[index] : nil
            let weather = index < (weatherCode?.count ?? 0) ? weatherCode?[index] : nil
            
            if uniqueTimeDict[formattedTime] == nil {
                uniqueTimeDict[formattedTime] = (time[index], temperature, precip, weather)
            }
        }
        
        let sortedUniqueTimes = uniqueTimeDict.keys.sorted {
            guard let date1 = formatDateToDate($0), let date2 = formatDateToDate($1) else { return false }
            return date1 < date2
        }
        
        let filteredTemperature = sortedUniqueTimes.compactMap { uniqueTimeDict[$0]?.1 }
        let filteredPrecipitation = sortedUniqueTimes.compactMap { uniqueTimeDict[$0]?.2 }
        let filteredWeatherCode = sortedUniqueTimes.compactMap { uniqueTimeDict[$0]?.3 }
        
        return Hourly(
            time: sortedUniqueTimes,
            temperature2M: filteredTemperature,
            precipitation: filteredPrecipitation,
            weatherCode: filteredWeatherCode
        )
    }
    
    private func formatDateToDate(_ formattedTime: String) -> Date? {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "h a"
        return outputFormatter.date(from: formattedTime)
    }
}
