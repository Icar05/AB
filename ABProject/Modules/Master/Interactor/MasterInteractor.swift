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
    
    weak var globalProvider: GlobalProvider!
    
    func getWeatcher() -> Observable<[RootClass]> {
        return globalProvider.getWeather(city: "Kiev")
    }
    
}
