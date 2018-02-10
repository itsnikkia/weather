//
//  ViewController.swift
//  weather
//
//  Created by Nikki Agarwal on 2/9/18.
//  Copyright © 2018 Nikki Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var CityLabel: UITextField!
    @IBOutlet weak var CurrentWeatherLabel: UILabel!
    @IBOutlet weak var CurrentTemperatureLabel: UILabel!
    @IBAction func GetWeather(_ sender: Any) {
        CurrentWeatherLabel.backgroundColor = UIColor.purple
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        CityLabel.text = "St. Charles, IL"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

