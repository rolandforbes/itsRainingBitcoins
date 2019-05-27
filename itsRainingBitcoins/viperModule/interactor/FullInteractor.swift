//
//  Interactor.swift
//  itsRainingBitcoins
//
//  Created by Roland Forbes on 5/25/19.
//  Copyright © 2019 Roland Forbes. All rights reserved.
////
//
import Foundation
import UIKit

class FullInteractor: FullPresenterInteractorProtocol {

    var presenter: InteractorToFullPresenterProtocol?
    
    func populateFullCityToUI(){
        print("test")
        self.presenter?.showFullCity()
    }

}
