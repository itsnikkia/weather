//
//  ViewController.swift
//  weather
//
//  Created by Nikki Agarwal on 2/9/18.
//  Copyright © 2018 Nikki Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UITextField!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var stateAbbreviationInput: UITextField!
    @IBOutlet weak var cityNameInput: UITextField!
    @IBOutlet weak var celsiusToggle: UISwitch!
    
    @IBOutlet weak var celsiusLabel: UILabel!
    
    @IBOutlet weak var weatherIcon: UIImageView!
    var weatherWearService: WeatherService = WundergroundWeatherService()
    var forecast: WeatherForecast?
    @IBAction func GetWeather(_ sender: Any) {
        
        // TODO: validate the user input; we can do this after we add more to the UI...
        
        // Take the argument values from the state and city input boxes
        // Multi-word city names need to have underscores between words
        let city = cityNameInput.text!.replacingOccurrences(of: " ", with: "_")
        let state = stateAbbreviationInput.text!
        
        // Call the Weather Web API's Forecast
        weatherWearService.getForecast(city, state) { (weatherForecast, error) in
            if error != nil {
                // Deal with error here
                return
            } else if let weatherForecast = weatherForecast {
               self.forecast = weatherForecast
                self.currentWeatherLabel.text = weatherForecast.forecast?.txt_forecast?.forecastday?[0].fcttext
                if self.celsiusToggle.isOn {
                    self.currentTemperatureLabel.text = weatherForecast.forecast?.simpleforecast?.forecastday?[0].high?.celsius
                }
                else {
                    self.currentTemperatureLabel.text = weatherForecast.forecast?.simpleforecast?.forecastday?[0].high?.fahrenheit
                }
                
                // Getting the image from a URL requires converting the URL contents to a Data object
                //  to use in initializing a UIImage
                do {let data = try Data(contentsOf: (weatherForecast.forecast?.txt_forecast?.forecastday?[0].icon_url)!)
                    self.weatherIcon.image = UIImage(data: data)
                } catch {
                    // TODO: deal with error converting image from url
                }
            }
            else {
                // Deal with no error, no forecast!
            }
            self.cityLabel.text = "\(self.cityNameInput.text!), \(self.stateAbbreviationInput.text!)"
        }
    }
    @IBAction func toggleTemperature(_ sender: Any) {
        if let forecast = forecast {
            if celsiusToggle.isOn {
                currentTemperatureLabel.text = "\(forecast.forecast?.simpleforecast?.forecastday?[0].high?.celsius!), °C"
                celsiusLabel.text = "Celsius"
                
            }
            else {
                currentTemperatureLabel.text = "\(forecast.forecast?.simpleforecast?.forecastday?[0].high?.fahrenheit!), °F!"
                celsiusLabel.text = "Fahrenheit"
                }
            }
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityLabel.text = "St. Charles, IL"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

