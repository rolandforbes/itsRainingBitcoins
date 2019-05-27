//
//  File.swift
//  itsRainingBitcoins
//
//  Created by Roland Forbes on 5/25/19.
//  Copyright © 2019 Roland Forbes. All rights reserved.
//

import Foundation

class Presenter : ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    var interactor: PresenterInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func updateView() {
        interactor?.getWeatherData()
    }
    
    
}

extension Presenter: InteractorToPresenterProtocol {
    
    func weGotTheWeather(weather: ListOfCities){
        view?.showWeather(weather: weather)
    }
    
    func couldntFindWeather() {
        view?.couldntFindWeather()
    }
}

