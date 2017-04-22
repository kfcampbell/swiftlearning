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
        
        let task = session.dataTask(with: url!) {
            data, response, err in // don't understand this yet
            
            // check for "hard" (?) error first
            if let error = err {
                NSLog("Weather API error: \(error)")
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200:
                    if let dataString = String(data: data!, encoding: .utf8) {
                        NSLog(dataString)
                    }
                case 401:
                    NSLog("Weather API returned unauthorized response. There's probably a problem with the API key")
                default:
                    NSLog("Weather API returned \(httpResponse.statusCode) and \(HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))")
                }
            }
        }
        
        task.resume()
    }
}
