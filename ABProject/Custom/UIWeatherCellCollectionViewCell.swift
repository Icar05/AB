//
//  UIWeatherCellCollectionViewCell.swift
//  ABProject
//
//  Created by Ipinguin_linuxoid on 2019/02/05.
//  Copyright © 2019 Eddson. All rights reserved.
//

import UIKit

class UIWeatherCellCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var humidrity: UILabel!
    
    func createCell(item: List){
        descLabel.text = item.weather[0].main
        timeLabel.text =  getDate(input: item.dt)
        weatherIcon.image = UIImage(named: item.weather[0].icon)
        humidrity.text = String(item.main.humidity)
        
        
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2.0
    }
    
    
    
    func getDate(input: Int?) -> String?{
        let date = NSDate(timeIntervalSince1970: Double(input!))
        
        let dayTimePeriodFormatter = DateFormatter()
            dayTimePeriodFormatter.dateFormat = "dd MMM YYYY hh:mm:SS"
        
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        
        return dateString
    }
    
}
