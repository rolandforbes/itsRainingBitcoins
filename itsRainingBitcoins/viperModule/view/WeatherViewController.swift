//
//  WeatherViewController.swift
//  itsRainingBitcoins
//
//  Created by Roland Forbes on 5/24/19.
//  Copyright © 2019 Roland Forbes. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    var listOfCities: ListOfCities?
    let btn = UIButton()
    let tableView = UITableView()
    var locationManager: CLLocationManager!
    var presenter: ViewToPresenterProtocol?
    var selectedCity: WeatherModel?
    var data = [CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addBackground()
        self.addCheckWeatherBtn()
        self.addTableView()
        
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }

        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 70.0
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        self.tableView.isHidden = true
        CurrentUserCacheObject.hasGrantedLocationPermission = dealWithLocationServices()
        presenter?.updateView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.initUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func checkWeather(_ sender: Any) {
        if self.btn.titleLabel?.text == "Check The Weather" {
            btn.setTitle("Cancel", for: .normal)
            self.tableView.reloadData()
            self.tableView.isHidden = false
            return
        } else {
            btn.setTitle("Check The Weather", for: .normal)
            self.tableView.isHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewFull" {
            if let destinationVC = segue.destination as? FullCityVC {
                destinationVC.selectedCity = self.selectedCity
            }
        }
    }
    
    func initUI(){
        self.tableView.isHidden = true
        self.navigationItem.title = "Look Before You Leap"
        btn.frame = CGRect(x: 25, y: (Screen.h - 100), width: (Screen.w-50), height: 75)
        btn.setTitle("Check The Weather", for: .normal)
        
    }
}

extension WeatherViewController: CLLocationManagerDelegate {
    
    func dealWithLocationServices() -> Bool! {
        var status = false
        
        if CLLocationManager.locationServicesEnabled()
        {
            switch(CLLocationManager.authorizationStatus())
            {
            case .authorizedAlways, .authorizedWhenInUse:
                status = true
                if locationManager.location != nil {
                    CurrentUserCacheObject.lon = Int(locationManager.location!.coordinate.longitude)
                    CurrentUserCacheObject.lat = Int(locationManager.location!.coordinate.latitude)
                } else {
                    CurrentUserCacheObject.hasGrantedLocationPermission = false
                }
                break
            case .denied, .notDetermined, .restricted:
                print("Denied.")
            }
        }
        return status
    }
}

extension WeatherViewController: PresenterToViewProtocol {
    
    func showWeather(weather: ListOfCities) {
        if weather != nil && weather.cities != nil {
            for ct in weather.cities! {
                let cell = CellData.init(city: ct.cityName, icon: ct.iconImage, temperature: ct.temperature)
                self.data.append(cell)
            }
        }
        self.btn.isEnabled = true
    }
    
    func couldntFindWeather() {
        let errorAlert = UIAlertController(title: "Oops. There's been a problem.", message: "We couldn't find the weather :(", preferredStyle: .alert)
        
        errorAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(errorAlert, animated: true, completion: nil)
    }
}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.city = self.data[indexPath.row].city
        cell.icon = self.data[indexPath.row].icon
        if cell.icon == nil {
            cell.icon = UIImage(named: "default")
        }
        cell.temperature = self.data[indexPath.row].temperature
        if cell.temperature == nil {
            cell.temperature = "N/A"
        }
        cell.layoutSubviews()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = data[indexPath.row].city
        self.selectedCity = CurrentUserCacheObject.listOfCities?.cities?.first { $0.cityName == city }
        self.performSegue(withIdentifier: "viewFull", sender: self)
    }
    
    func addBackground(){
        let bckView = UIImageView(frame: CGRect(x: 0, y: 0, width: Screen.w, height: Screen.h))
        bckView.image = UIImage(named: "dougs")
        bckView.contentMode = .scaleAspectFill
        self.view.addSubview(bckView)
    }
    
    func addCheckWeatherBtn() {
        btn.frame = CGRect(x: 25, y: (Screen.h - 100), width: (Screen.w-50), height: 75)
        btn.setTitle("Check The Weather", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Avenir", size: 32)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 2
        btn.addTarget(self, action: #selector(checkWeather(_:)), for: .touchUpInside)
        btn.isEnabled = false
        btn.layer.cornerRadius = 5
        self.view.addSubview(btn)
    }
    
    func addTableView(){
        tableView.frame = CGRect(x: 0, y: 80, width: Screen.w, height: 210)
        self.view.addSubview(tableView)
    }
}

