//
//  DetailInteractor.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import RxSwift
import MapKit

class DetailInteractorImpl: DetailInteractor {
    
    
    
    var globalProvider: GlobalProvider!
    
    var locationUtil: LocationUtil!
    
    
    
    
    init(provider: GlobalProvider!, lUtil: LocationUtil!){
        self.globalProvider = provider
        self.locationUtil = lUtil
    }
    
    
    func getWeatcher(coords: CLLocationCoordinate2D) -> Observable<List> {
        return globalProvider.getWeather(coords: coords)
            .delay(.milliseconds(100), scheduler: MainScheduler.instance)
    }
    
    func getWeatcher(city: String) -> Observable<WeatherResponce> {
        return globalProvider.getWeather(city: city)
            .delay(.milliseconds(100), scheduler: MainScheduler.instance)
    }
    
    func getLocationByCityName(city: String) -> Observable<CLLocationCoordinate2D> {
        return locationUtil.getLocationByCityName(city: city)
    }
   
}
