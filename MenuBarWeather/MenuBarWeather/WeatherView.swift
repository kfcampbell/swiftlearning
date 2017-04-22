//
//  WeatherView.swift
//  MenuBarWeather
//
//  Created by Keegan Campbell on 4/22/17.
//  Copyright © 2017 Keegan Campbell. All rights reserved.
//

import Cocoa

class WeatherView: NSView {
    @IBOutlet weak var cityTextField: NSTextField!
    @IBOutlet weak var tempConditionsTextField: NSTextField!
    @IBOutlet weak var weatherImageView: NSImageView!
    
    func update(weather: Weather) {
        // force update UI on main thread using DispatchQueue.main
        DispatchQueue.main.async {
            self.cityTextField.stringValue = weather.city
            self.tempConditionsTextField.stringValue = "\(Int(weather.currentTemp))°F and \(weather.conditions)"
            self.weatherImageView.image = NSImage(named: weather.icon)
        }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
