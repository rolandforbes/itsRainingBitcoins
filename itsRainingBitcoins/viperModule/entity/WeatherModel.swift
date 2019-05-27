//
//  WeatherModel.swift
//  itsRainingBitcoins
//
//  Created by Roland Forbes on 5/25/19.
//  Copyright © 2019 Roland Forbes. All rights reserved.
//

import Foundation
import UIKit

class UserCoordinates {
    internal var latitude: String?
    internal var longitude: String?
}

class ListOfCities {
    init() {
        cities = []
    }
    
    internal var cities: [WeatherModel]?
}

class WeatherModel {
    
    init(json: [String: Any]) {
        let windJson = json["wind"] as? [String: Double]
        if windJson != nil {
            let sp = windJson!["speed"]
            if sp != nil {
                self.wind = String(sp!)
            }
        }
        
        let clouds = json["clouds"] as? [String: Double]
        if clouds != nil {
            let cl = clouds!["all"]
            if cl != nil {
                self.cloudInfo = String(cl!)
            }
        }
        
        if let content = json["weather"] as? [[String: Any]] {
            for c in content {
                let desc = c["description"] as? String
                if desc != nil {
                    self.description = desc
                }
                let icon = c["icon"] as? String
                if icon != nil {
                    self.icon = icon
                }
            }
        }
        
        let tmp = json["main"] as? [String:Double]
        if tmp != nil {
            let tp = tmp!["temp"]
            if tp != nil {
                var t = String(tp!)
                var fullNameArr = t.split(separator: ".")
                if let t = fullNameArr.first {
                    self.temperature = String(t)
                } else {
                    self.temperature = t
                }
            }
        }
        
    }
    
    init(city: String!){
        self.cityName = city
    }

    internal var cityName: String?
    internal var temperature: String?
    internal var icon: String?
    internal var iconImage: UIImage?
    internal var wind: String?
    internal var cloudInfo: String?
    internal var description: String?
}


