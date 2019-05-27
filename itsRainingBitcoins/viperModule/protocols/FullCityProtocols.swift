//
//  FullCityProtocols.swift
//  itsRainingBitcoins
//
//  Created by Roland Forbes on 5/26/19.
//  Copyright © 2019 Roland Forbes. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToFullViewProtocol: class {
    func showFullCityVC()
    func failedToLoad()
}

protocol InteractorToFullPresenterProtocol: class {
    func showFullCity()
    func failedToLoad()
}

protocol FullPresenterInteractorProtocol: class {
    func populateFullCityToUI()
}

protocol FullViewToPresenterProtocol: class {
    var view: PresenterToFullViewProtocol? {get set}
    var interactor: FullPresenterInteractorProtocol? {get set}
    var router: FullPresenterToRouter? {get set}
    
    func updateFullView()
}


protocol FullPresenterToRouter: class {
    static func getFullCity() -> UIViewController
}

