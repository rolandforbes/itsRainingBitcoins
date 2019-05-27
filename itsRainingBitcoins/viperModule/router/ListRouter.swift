//
//  WeatherRouter.swift
//  itsRainingBitcoins
//
//  Created by Roland Forbes on 5/25/19.
//  Copyright © 2019 Roland Forbes. All rights reserved.
//

import Foundation
import UIKit

class WeatherRouter: PresenterToRouterProtocol {
    
    class func createModule() -> UIViewController {
        let view = mainStoryBoard.instantiateViewController(withIdentifier: "WeatherViewController") as? WeatherViewController
        
        let presenter = Presenter()
        let interactor = Interactor()
        let router = WeatherRouter()
        
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

