//
//  WeatherRouter.swift
//  itsRainingBitcoins
//
//  Created by Roland Forbes on 5/25/19.
//  Copyright © 2019 Roland Forbes. All rights reserved.
//

import Foundation
import UIKit

class FullRouter: FullPresenterToRouter {
   
    class func getFullCity() -> UIViewController {
        let view = mainStoryBoard.instantiateViewController(withIdentifier: "FullCityVC") as? FullCityVC
        
        let presenter = FullPresenter()
        let interactor = FullInteractor()
        let router = FullRouter()
        
        view?.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter
        
        return view!
    }
    
    static var mainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}

