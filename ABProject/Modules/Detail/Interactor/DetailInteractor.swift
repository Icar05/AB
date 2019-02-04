//
//  DetailInteractor.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import RxSwift

class DetailInteractorImpl: DetailInteractor {
    
    
    var globalProvider: GlobalProvider!
    
    init(provider: GlobalProvider!){
        self.globalProvider = provider
    }
    
    
    func getWeatcher(city: String) -> Observable<[List]> {
        return globalProvider.getWeather(city: city)
    }
    
   
}
