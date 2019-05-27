//
//  File.swift
//  itsRainingBitcoins
//
//  Created by Roland Forbes on 5/25/19.
//  Copyright © 2019 Roland Forbes. All rights reserved.
////

import Foundation
import UIKit

class FullPresenter : FullViewToPresenterProtocol {
    var view: PresenterToFullViewProtocol?
    var interactor: FullPresenterInteractorProtocol?
    var router: FullPresenterToRouter?
    
    func updateFullView(){
        interactor?.populateFullCityToUI()
        
    }
}

extension FullPresenter: InteractorToFullPresenterProtocol {
    
    func showFullCity(){
        view?.showFullCityVC()
    }
    
    func failedToLoad() {
        view?.failedToLoad()
    }
    
}

