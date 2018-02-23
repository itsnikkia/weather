//
//  WeatherWearService.swift
//  weather
//
//  Created by Dorothy Lee on 2/22/18.
//  Copyright © 2018 Nikki Agarwal. All rights reserved.
//


import Foundation

protocol WeatherService {
    func getForecast(_ city: String, _ state: String,
                     completionHandler: @escaping (WeatherForecast?, Error?) -> Void)
    func cancel()
}

class WundergroundWeatherService: NSObject, WeatherService, URLSessionDelegate {
    
    lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration,
                          delegate: self, delegateQueue: OperationQueue.main)
    }()
    
    let weatherUndergroundKey = "ad6fae97afface29"
    let weatherUndergroundBaseAddress = "https://api.wunderground.com/api/"
    
    // Get the forecast from the Weather Underground API Web Service
    // Because this needs to be an asynchronous tast, the completion handler has the @escaping attribute
    // The task will run on a separate thread from the app's main thread
    func getForecast(_ city: String, _ state: String,
                     completionHandler: @escaping (WeatherForecast?, Error?) -> Void) {
        
        // Example API Request: http://api.wunderground.com/api/ad6fae97afface29/forecast/q/CA/San_Francisco.json
        let weatherUndergroundForecastURL =  "\(weatherUndergroundBaseAddress)\(weatherUndergroundKey)/forecast/q/\(state)/\(city).json"
        let components = URLComponents(string: weatherUndergroundForecastURL)!
        guard let url = components.url else {return}
        
        let request = URLRequest(url: url)
        
        let dataTask = session.dataTask(with: request) {
            (data, response, error) in
            // -------> Deal with data/error
            if let error = error {
                completionHandler(nil, error)
            }
            guard let data = data else { return }
            // Upon successful return of data, extract the forecast information from the JSON Data returned
            self.parseJSON(data: data, completionHandler: completionHandler)
            
        }
        dataTask.resume()
        
    }
    
    func cancel() {
        // TODO: Cancel any web service operations
    }
    
    // Parse the JSON formatted data to create a WeatherForecast object instance of our data model
    // For now, we are only going to extract a few pieces from this complex nested JSON structure
    // to populate some of the properties of our complex nested data model class instance
    private func parseJSON(data: Data,
                           completionHandler: @escaping (WeatherForecast?, Error?) -> Void) {
        do {
            // Extract the JSON from the outside in
            if let dataAsJSON =
                // Get the root level data as a dictionary of any type, keyed by string
                // For this API we expect dictionary keys of "response" and "forecast"
                try JSONSerialization.jsonObject( with: data, options: []) as? [String: Any],
                // Get the "forecast" data from the root dictionary using its key
                let forecastJSON = dataAsJSON["forecast"] as? [String: Any],
                // Get the "txt_forcast" data from the forecast dictionary using its key
                let textForecast = forecastJSON["txt_forecast"] as?  [String: Any],
                // Get the date property value from within the txt_forecast object
                let forecastDate = textForecast["date"] as? String,
                // Get the array of forecast days from the textForecast dictionary
                let forecastDays = textForecast["forecastday"] as? [Any],
                // For our purposes, we will only look at the first forcast day in the array
                let currentForecast = forecastDays[0] as? [String: Any],
                // Let's atart by only getting one property value from forecast day and add more later
                let currentForecastText = currentForecast["fcttext"] as? String
            {
                // Build the WeatherForecast Object instance from the inside out
                let txtForecastDay = TxtForecastDay()
                txtForecastDay.fctText = currentForecastText
                
                let txtForecast = TxtForecast()
                txtForecast.forecastDate = forecastDate
                txtForecast.forecastDays = [txtForecastDay]
                
                let forecast = Forecast()
                forecast.txtForecast = txtForecast
                
                let weatherForecast = WeatherForecast()
                weatherForecast.forecast = forecast
                
                completionHandler(weatherForecast,nil) }
            else {
                completionHandler(nil, nil)
            }
        } catch let error as NSError {
            completionHandler(nil, error)
            return
        }
    }
}


