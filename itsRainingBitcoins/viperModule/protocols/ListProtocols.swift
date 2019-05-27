//
//  WeatherProtocols.swift
//  itsRainingBitcoins
//
//  Created by Roland Forbes on 5/25/19.
//  Copyright © 2019 Roland Forbes. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToViewProtocol: class {
    func showWeather(weather: ListOfCities)
    func couldntFindWeather()
}

protocol InteractorToPresenterProtocol: class {
    func weGotTheWeather(weather: ListOfCities)
    func couldntFindWeather()
}

protocol PresenterInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? {get set}
    func getWeatherData()
}

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    
    func updateView()
}

protocol PresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}


