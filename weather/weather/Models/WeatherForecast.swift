//
//  WeatherForecast.swift
//  weather: model for the WeatherForecast returned from Wunderground API
//  API call example: http://api.wunderground.com/api/ad6fae97afface29/forecast/q/IL/Geneva.json
//
//  Created by Dorothy Lee on 2/21/18.
//  Copyright © 2018 Nikki Agarwal. All rights reserved.
//

import Foundation

class WeatherForecast {
    var response: Response? = nil
    var forecast: Forecast? = nil
}

class Response  {
    let version: String? = nil
    let termsofService: String? = nil
    let features: Feature? = nil
}
class Feature  {
    var forecast: Int? = nil
}

class Forecast  {
    var txtForecast: TxtForecast? = nil
    var simpleForecast: SimpleForecast? = nil
}

class TxtForecast {
    var forecastDate: String? = nil
    var forecastDays: [TxtForecastDay]? = nil
    
}

class TxtForecastDay  {
    var period: Int? = nil
    var icon: String? = nil
    var iconUrl: URL? = nil
    var title: String? = nil
    var fctText: String? = nil
    var fctTextMetric: String? = nil
    var pop: String? = nil
   
}

class SimpleForecast {
    let forecastDay: [ForecastDay]? = nil
}

class ForecastDay {
    let date: ForecastDate? = nil
    let period: Int? = nil
    let high: FarenheitCelsius? = nil
    let low: FarenheitCelsius? = nil
    let conditions: String? = nil
    let icon: String? = nil
    let icon_url: URL? = nil
    let skyicon: String? = nil
    let pop: Int? = nil
    let qpf_allday: InchesMillimeters? = nil
    let qpf_day: InchesMillimeters? = nil
    let qpf_night: InchesMillimeters? = nil
    let snow_allday: InchesCentimeters? = nil
    let snow_day: InchesCentimeters? = nil
    let snow_night: InchesCentimeters? = nil
    let maxwind: WindDescription? = nil
    let avewind: WindDescription? = nil
    let avehumidity: Int? = nil
    let maxhumidity: Int? = nil
    let minhumidity: Int? = nil
   
    
}

class ForecastDate  {
    let epoch: String? = nil
    let pretty: String? = nil
    let day: Int? = nil
    let month: Int? = nil
    let year: Int? = nil
    let yday: Int? = nil
    let hour: Int? = nil
    let min: String? = nil
    let sec: Int? = nil
    let isdst: String? = nil
    let monthname: String? = nil
    let monthname_short: String? = nil
    let weekday_short: String? = nil
    let weekday: String? = nil
    let ampm: String? = nil
    let tz_short: String? = nil
    let tz_long: String? = nil
    
}

class FarenheitCelsius  {
    let farhenheit: String? = nil
    let celsius: String? = nil
}

class InchesCentimeters  {
    let inches: Int? = nil
    let centimeters: Int? = nil
   
}

class InchesMillimeters {
    let inches: Int? = nil
    let millimeters: Int? = nil
   
}

class WindDescription {
    let mph: Int? = nil
    let kph: Int? = nil
    let dir: String? = nil
    let degrees: Int? = nil
}

