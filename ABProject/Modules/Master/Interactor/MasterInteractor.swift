//
//  MasterInteractor.swift
//  ABProject
//
//  Created by Eddson on 29.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import RxSwift

class MasterInteratorImpl: MasterInteractor {
    
    
    var globalProvider: GlobalProvider!
    
    init(provider: GlobalProvider!){
        self.globalProvider = provider
    }
    
    
    
    func getWeatcher() -> Observable<[List]> {
        return globalProvider.getWeather(city: "Kiev")
    }
    
}
