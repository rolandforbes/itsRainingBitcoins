//
//  Global.swift
//  itsRainingBitcoins
//
//  Created by Roland Forbes on 5/26/19.
//  Copyright © 2019 Roland Forbes. All rights reserved.
//

import Foundation
import UIKit


struct CellData {
    let city: String?
    let icon: UIImage?
    let temperature: String?
}

class CustomCell: UITableViewCell {
    var city : String?
    var icon : UIImage?
    var temperature : String?
    
    var cityView: UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.font = UIFont(name: "Avenir", size: 35)
        
        return textView
    }()
    var iconView: UIImageView = {
        var imgView = UIImageView()
        return imgView
    }()
    
    var tempView: UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.font = UIFont(name: "Avenir", size: 20)
        
        return textView
    }()


    override func layoutSubviews() {
        super.layoutSubviews()
        if let pr = city {
            cityView.text = pr
        }
        if let ic = icon {
            iconView.image = ic
        }
        if let tp = temperature {
            tempView.text = tp + "°"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(cityView)
        self.addSubview(tempView)
        self.addSubview(iconView)
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(68)]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": iconView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(68)]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": iconView]))
        
        cityView.widthAnchor.constraint(equalToConstant: 200)
        cityView.leftAnchor.constraint(equalTo: iconView.rightAnchor).isActive = true
        
        tempView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tempView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

struct Screen {
    
    init() {
        
    }
    
    static var h: CGFloat! = UIScreen.main.bounds.size.height
    static var w: CGFloat! = UIScreen.main.bounds.size.width
}

struct CurrentUserCacheObject {
    
    init() {
        
    }
    
     static var hasGrantedLocationPermission: Bool! = false
     static var lat: Int?
     static var lon: Int?
     static var listOfCities: ListOfCities!
}

