////
////  FullCityVC.swift
////  itsRainingBitcoins
////
////  Created by Roland Forbes on 5/26/19.
////  Copyright © 2019 Roland Forbes. All rights reserved.
////

import Foundation
import UIKit

class FullCityVC: UIViewController {
    
    var presenter: FullViewToPresenterProtocol?
    var selectedCity: WeatherModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateToUI()
        presenter?.updateFullView()
    }
    
}

extension FullCityVC: PresenterToFullViewProtocol {
    
    func showFullCityVC() {
        
    }
    
    func failedToLoad() {
        
    }
    
    func populateToUI(){
        let bckView = UIImageView(frame: CGRect(x: 0, y: 0, width: Screen.w, height: (Screen.h/1.5)))
        bckView.contentMode = .scaleAspectFill
        if selectedCity.cityName == "Your Location" {
            bckView.image = UIImage(named: "skydive")
        } else {
             bckView.image = UIImage(named: selectedCity.cityName!)
        }
        
        self.navigationItem.title = "Weather in " + (selectedCity?.cityName!)!
        

        var windSpeed = UILabel(frame: CGRect(x: 25, y: (Screen.h - 270), width: (Screen.w-50), height: 75))
        if selectedCity.wind != nil {
            windSpeed.text = "Wind Speed: " + (selectedCity?.wind!)!
        } else {
            windSpeed.text = "Unknown Windspeed"
        }
        windSpeed.center.x = (Screen.w / 2)
        windSpeed.font = UIFont(name: "Avenir", size: 36)
        self.view.addSubview(windSpeed)
        
        var clouds = UILabel(frame: CGRect(x: 25, y: (Screen.h - 130), width: (Screen.w-50), height: 75))
        if selectedCity.cloudInfo != nil {
            clouds.text = "Clouds: " + (selectedCity?.cloudInfo!)! + "%"
        } else {
            clouds.text = "Unknown Cloud %"
        }
        clouds.font = UIFont(name: "Avenir", size: 36)
        
        self.view.addSubview(clouds)
        self.view.addSubview(bckView)
    }
    
}
