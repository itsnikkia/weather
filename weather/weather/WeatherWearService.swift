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
    // Because this needs to be an asynchronous task, the completion handler has the @escaping attribute;
    // the task will run on a separate thread from the app's main thread
    func getForecast(_ city: String, _ state: String,
                     completionHandler: @escaping (WeatherForecast?, Error?) -> Void) {
        
        // Example API Request: http://api.wunderground.com/api/ad6fae97afface29/forecast/q/CA/San_Francisco.json
        let weatherUndergroundForecastURL =  "\(weatherUndergroundBaseAddress)\(weatherUndergroundKey)/forecast/q/\(state)/\(city).json"
        // investigate error happening on next line with unwrapping
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
    
    // func parseJSON: Decode JSON returned in the Web API Response into an instance of our data model object
    private func parseJSON(data: Data, completionHandler: @escaping (WeatherForecast?, Error?) -> Void) {
        do {
            
            let decoder = JSONDecoder()
            //Because we used the exact property names in our WeatherForecast class definition for WeatherForecast,
            // it will all map using the one line of code
            let webForecast = try decoder.decode(WeatherForecast.self, from: data)
            completionHandler(webForecast,nil)
            
        } catch let error as NSError {
            print (error)
            completionHandler(nil, error)
            return
        }
    }
}


