//
//  WeatherAPIService.swift
//  MenuBarWeather
//
//  Created by Keegan Campbell on 4/22/17.
//  Copyright © 2017 Keegan Campbell. All rights reserved.
//

import Foundation

struct Weather {
    var city: String
    var currentTemp: Float
    var conditions: String
    var icon: String
    
    var description: String {
        return "\(city): \(currentTemp)F and \(conditions)"
    }
}

class WeatherApi {
    let keys = Keys()
    let BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
    
    func fetchWeather(query: String, success: @escaping (Weather) -> Void) {
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
                    if let weather = self.getWeatherFromJsonData(data: data!) {
                        success(weather)
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
    
    func getWeatherFromJsonData(data: Data) -> Weather? {
        typealias JSONDict = [String:AnyObject]
        let json: JSONDict
        
        do {
            json = try JSONSerialization.jsonObject(with: data, options: []) as! JSONDict
        } catch {
            NSLog("JSON parsing failed: \(error)")
            return nil
        }
        
        var mainDict = json["main"] as! JSONDict
        var weatherList = json["weather"] as! [JSONDict]
        var weatherDict = weatherList[0]
        
        let weather = Weather(
            city: json["name"] as! String,
            currentTemp: mainDict["temp"] as! Float,
            conditions: weatherDict["main"] as! String,
            icon: weatherDict["icon"] as! String
        )
    
        return weather
    }

}
