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
    
    @IBOutlet weak var weatherIcon: UIImageView!
    var weatherWearService: WeatherService = WundergroundWeatherService()
    
    @IBAction func GetWeather(_ sender: Any) {
        
        // take the argument values from the state and city input boxes
        let city = cityNameInput.text!.replacingOccurrences(of: " ", with: "_")
        let state = stateAbbreviationInput.text!
        
        weatherWearService.getForecast(city, state) { (weatherForecast, error) in
            if error != nil {
                // Deal with error here
                return
            } else if let weatherForecast = weatherForecast {
               self.currentWeatherLabel.text = weatherForecast.forecast?.txtForecast?.forecastDays?[0].fctText
                do {let data = try Data(contentsOf: (weatherForecast.forecast?.txtForecast?.forecastDays?[0].iconUrl)!)
                self.weatherIcon.image = UIImage(data: data)
                } catch {
                
                }
            }
            else {
                // Deal with no error, no forecast!
                
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

