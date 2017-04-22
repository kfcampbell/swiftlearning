//
//  WeatherAPIService.swift
//  MenuBarWeather
//
//  Created by Keegan Campbell on 4/22/17.
//  Copyright © 2017 Keegan Campbell. All rights reserved.
//

import Foundation

class WeatherApi {
    let keys = Keys()
    let BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
    
    func fetchWeather(_ query: String) {
        let session = URLSession.shared
        let escapedQuery = query.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        
        let url = URL(string: "\(BASE_URL)?APPID=\(keys.weatherApiKey)&units=imperial&q=\(escapedQuery!)")
        
        
    }
}
