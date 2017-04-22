//
//  StatusMenuController.swift
//  MenuBarWeather
//
//  Created by Keegan Campbell on 4/22/17.
//  Copyright © 2017 Keegan Campbell. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var weatherView: WeatherView!
    var weatherMenuItem: NSMenuItem!
    
    var weatherApi: WeatherApi!

    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    override func awakeFromNib() {
        let icon = NSImage(named: "statusIcon")
        icon?.isTemplate = true
        statusItem.image = icon
        statusItem.menu = statusMenu
        
        weatherMenuItem = statusMenu.item(withTitle: "Weather")
        weatherMenuItem.view = weatherView
        
        weatherApi = WeatherApi()
        updateWeather()
    }
    
    @IBAction func updateClicked(_ sender: NSMenuItem) {
        updateWeather()
    }
    
    func updateWeather() {
        weatherApi.fetchWeather(query: "Seattle") { weather in
            self.weatherView.update(weather: weather)
        }
    }
    
    @IBAction func quitClicked(_ sender: NSMenuItem) {
        NSApplication.shared().terminate(self)
    }
}
