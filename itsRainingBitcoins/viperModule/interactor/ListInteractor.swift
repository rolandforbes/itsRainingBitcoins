//
//  Interactor.swift
//  itsRainingBitcoins
//
//  Created by Roland Forbes on 5/25/19.
//  Copyright © 2019 Roland Forbes. All rights reserved.
//

import Foundation
import UIKit

class Interactor: PresenterInteractorProtocol {
    
    var appId = "b6907d289e10d714a6e88b30761fae22"
    var enforceOnce: Bool! = false
    var group = DispatchGroup()
    let imgURL = "https://openweathermap.org/img/w/10d.png"
    var presenter: InteractorToPresenterProtocol?
    var queryString = ""
    let weatherURL = "https://samples.openweathermap.org/data/2.5/weather?"
    
    func getWeatherData(){
        self.group.enter()
        if CurrentUserCacheObject.hasGrantedLocationPermission == true && CurrentUserCacheObject.lat != nil {
            queryString = String(CurrentUserCacheObject.lat!) + "&lon=" + String(CurrentUserCacheObject.lon!)
        } else {
            //User didn't grant location. Fail gracefully by pulling up another city
            queryString = "q=Denver"
        }
        
        self.callApiForData(isImageRequest: false, input: self.queryString, cityName: "Your Location" , obj: nil, lastIteration: false)
        self.callApiForData(isImageRequest: false, input: "q=London", cityName: "London", obj: nil, lastIteration: false)
        self.callApiForData(isImageRequest: false, input: "q=Tokyo", cityName: "Tokyo", obj: nil, lastIteration: true)
        self.group.wait()
        
        group.notify(queue: .main) {
            self.presenter?.weGotTheWeather(weather: CurrentUserCacheObject.listOfCities)
        }
    }
    
    func callApiForData(isImageRequest: Bool!, input: String?, cityName: String?, obj: WeatherModel?, lastIteration: Bool!){
        
        let session = URLSession.shared
        var urlType = ""
        var todoEndPoint = ""
        
        if isImageRequest == true {
            urlType = imgURL
            todoEndPoint = urlType
        } else {
            urlType = weatherURL
            todoEndPoint = urlType + input! + "&appid=" + appId
        }
        
        guard let url = URL(string: todoEndPoint) else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let task = session.dataTask(with: urlRequest) { (data, resp, err) in
            guard let response = data,
                err == nil else {
                    return
            }
            do{
                if isImageRequest == true {
                    obj?.iconImage = UIImage(data: response)
                } else {
                    let jsonResponse = try JSONSerialization.jsonObject(with:
                        response, options: []) as? [String: Any]
                    let newWeather = WeatherModel.init(json: jsonResponse!)
                    newWeather.cityName = cityName
                    if CurrentUserCacheObject.listOfCities == nil {
                        CurrentUserCacheObject.listOfCities = ListOfCities.init()
                    }
                    CurrentUserCacheObject.listOfCities.cities?.append(newWeather)
                    if newWeather.icon != nil {
                        self.callApiForData(isImageRequest: true, input: nil, cityName: nil, obj: newWeather, lastIteration: false)
                        return
                    }
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
            if CurrentUserCacheObject.listOfCities.cities?.count == 3 {
                if self.enforceOnce == false {
                    self.enforceOnce = true
                    self.group.leave()
                }

            }
        }
        task.resume()
    }
}
