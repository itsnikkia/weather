//
//  WeatherForecast.swift
//  weather: model for the WeatherForecast returned from Wunderground API
//  API call example: http://api.wunderground.com/api/ad6fae97afface29/forecast/q/IL/Geneva.json
//
//  Created by Dorothy Lee on 2/21/18.
//  Copyright © 2018 Nikki Agarwal. All rights reserved.
//

import Foundation

class WeatherForecast: Codable {
    
    let response: Response?
    let forecast: Forecast?
}

class Response: Codable {
    let version: String?
    let termsofService: String?
    let features: Feature?
}
class Feature: Codable {
    let forecast: Int?
}

class Forecast: Codable {
    let txtForecast: TxtForecast?
    let simpleForecast: SimpleForecast?
}

class TxtForecast: Codable{
    let forecastDate: String?
    let forecastDay: [TxtForecastDay]?
    enum CodingKeys: String, CodingKey {
        case forecastDate = "date"
        case forecastDay = "forecastday"
    }
}

class TxtForecastDay: Codable {
    let period: Int?
    let icon: String?
    let iconUrl: URL?
    let title: String?
    let fctText: String?
    let fctTextMetric: String?
    let pop: String?
    enum CodingKeys: String, CodingKey {
        case period
        case icon
        case iconUrl = "icon_url"
        case title
        case fctText = "fcttext"
        case fctTextMetric = "fcttext_metric"
        case pop
    }
}

class SimpleForecast: Codable{
    let forecastDay: [ForecastDay]?
}

class ForecastDay: Codable {
    let date: ForecastDate?
    let period: Int?
    let high: FarenheitCelsius?
    let low: FarenheitCelsius?
    let conditions: String?
    let icon: String?
    let icon_url: URL?
    let skyicon: String?
    let pop: Int?
    let qpf_allday: InchesMillimeters?
    let qpf_day: InchesMillimeters?
    let qpf_night: InchesMillimeters?
    let snow_allday: InchesCentimeters?
    let snow_day: InchesCentimeters?
    let snow_night: InchesCentimeters?
    let maxwind: WindDescription?
    let avewind: WindDescription?
    let avehumidity: Int?
    let maxhumidity: Int?
    let minhumidity: Int?
    /*
    enum CodingKeys: String, CodingKey {
        case forecastDate
        case period
        case high
        case low
        case conditions
        case icon
        case iconURL
        case skyicon
        case pop
        case qpfAllDay
        case qpfDay
        case qpfNight
        case snowAllDay
        case snowDay
        case snowNight
        case maxWind
        case aveWind
        case aveHumidity
        case maxHumidity
        case minHumidity
    }
 */
    
}

class ForecastDate: Codable {
    let epoch: String?
    let pretty: String?
    let day: Int?
    let month: Int?
    let year: Int?
    let yday: Int?
    let hour: Int?
    let min: String?
    let sec: Int?
    let isdst: String?
    let monthname: String?
    let monthname_short: String?
    let weekday_short: String?
    let weekday: String?
    let ampm: String?
    let tz_short: String?
    let tz_long: String?
       
    }

class FarenheitCelsius: Codable {
    let farhenheit: String?
    let celsius: String?
}

class InchesCentimeters: Codable {
    let inches: Int?
    let centimeters: Int?
    enum CodingKeys: String, CodingKey {
        case inches = "in"
        case centimeters = "cm"
    }
}

class InchesMillimeters: Codable {
    let inches: Int?
    let millimeters: Int?
    enum CodingKeys: String, CodingKey {
        case inches = "in"
        case millimeters = "mm"
    }
}

class WindDescription: Codable {
    let mph: Int?
    let kph: Int?
    let dir: String?
    let degrees: Int?
}
