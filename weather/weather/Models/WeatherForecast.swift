//
//  WeatherForecast.swift
//  weather: data model for the WeatherForecast returned from Wunderground API
//  API call example: http://api.wunderground.com/api/ad6fae97afface29/forecast/q/IL/Geneva.json
//
//  Created by Dorothy Lee on 2/21/18.
//  Copyright © 2018 Nikki Agarwal. All rights reserved.
//

import Foundation

// WeatherForecast Class models the top-level object returned as JSON from the forecast API Call;
// It contains 2 nested objects (response and forecast), which in turn each contain several layers of nesting.
// Each class implements the Codable Protocol to allow the JSONDecoder to map the JSON response directly to a WeatherForecast instance
// Using property names that are an exact match in spelling and case to the field names in the JSON allows use of the default decoder to greatly simplify the coding:
//  let webForecast = try decoder.decode(WeatherForecast.self, from: data)

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
    let txt_forecast: TxtForecast?
    let simpleforecast: SimpleForecast?
}

class TxtForecast: Codable{
    let date: String?
    let forecastday: [TxtForecastDay]?
}

class TxtForecastDay: Codable {
    let period: Int?
    let icon: String?
    let icon_url: URL?
    let title: String?
    let fcttext: String?
    let fcttext_metric: String?
    let pop: String?
}

class SimpleForecast: Codable{
    let forecastday: [ForecastDay]?
}

class ForecastDay: Codable {
    let date: ForecastDate?
    let period: Int?
    let high: FahrenheitCelsius?
    let low: FahrenheitCelsius?
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

class FahrenheitCelsius: Codable {
    let fahrenheit: String?
    let celsius: String?
}

class InchesCentimeters: Codable {
    let `in`: Float?  // 'in' is a reserved word in Swift, so needs to be surrounded by backticks
    let cm: Float?
}

class InchesMillimeters: Codable {
    let `in`: Float?
    let mm: Float?
}

class WindDescription: Codable {
    let mph: Int?
    let kph: Int?
    let dir: String?
    let degrees: Int?
}

