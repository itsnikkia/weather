//
//  WeatherForecast.swift
//  weather: model for the WeatherForecast returned from Wunderground API
//  API call example: http://api.wunderground.com/api/ad6fae97afface29/forecast/q/IL/Geneva.json
//
//  Created by Dorothy Lee on 2/21/18.
//  Copyright © 2018 Nikki Agarwal. All rights reserved.
//

import Foundation

class WeatherForecastNested: Codable {
    class Response: Codable {
        let version: String
        let termsofService: String
        let features: Feature
    }
    
    class Feature: Codable {
        let forecast: Int
    }
    
    class Forecast: Codable {
        let txtForecast: TxtForecast
        let simpleForecast: SimpleForecast
    }
    
    class TxtForecast: Codable{
        let forecastDate: String
        let forecastDay: [ForecastDay]
        enum CodingKeys: String, CodingKey {
            case forecastDate = "date"
            case forecastDay = "forecastday"
        }
        class ForecastDay: Codable {
            let period: Int
            let icon: String
            let iconUrl: URL
            let title: String
            let fctText: String
            let fctTextMetric: String
            let pop: String
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
    }
    
    class SimpleForecast: Codable{
        let forecastDay: [ForecastDay]
        
        class ForecastDay: Codable {
            let foreCastDate: ForecastDate
            let period: Int
            
            class ForecastDate: Codable {
                let epoch: String
                let pretty: String
                let day: Int
                let month: Int
                let year: Int
                let yday: Int
                let hour: Int
                let min: String
                let sec: Int
                let isDayLightSavingsTime: String
                let monthName: String
                let monthNameShort: String
                let weekdayShort: String
                let weekday: String
                let amPm: String
                let timeZoneShort: String
                let timeZoneLong: String
                enum CodingKeys: String, CodingKey {
                    case pretty
                    case day
                    case month
                    case year
                    case yday
                    case hour
                    case min
                    case sec
                    case isDayLightSavingsTime = "isdst"
                    case monthName = "monthname"
                    case monthShortName = "monthname_short"
                    case weekdayShort = "weekday_short"
                    case weekday
                    case amPm = "ampm"
                    case timeZoneShort = "tz_short"
                    case timeZoneLong = "tz_long"
                }
            }
        }
    }   // end class SimpleForecast
    
    let response: Response
    let forecast: Forecast
}

