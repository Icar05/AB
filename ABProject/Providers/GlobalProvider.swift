//
//  GlobalProvider.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import AlamofireObjectMapper

class GlobalProvider{
    
    
    
    
    
    func getWeather(city: String) -> Observable<[RootClass]> {
        
        return Observable<[RootClass]>.create { observer -> Disposable in
            let request = Alamofire
                .request(self.getUrl(), method: .get)
                .validate()
                .responseArray(completionHandler: { (response: DataResponse<[RootClass]>) in
                    
                    switch response.result {
                        
                        case .success(let models):
                            observer.onNext(models)
                            observer.onCompleted()
                        
                        case .failure(let error):
                            observer.onError(error)
                        
                        }
                })
            
            return Disposables.create(with: {
                request.cancel()
            })
        }
    }
    
    
    
    
    func getUrl()-> String{
        
        let city = "München"
        
        let lang = "ua"
        
        let testKey = "bfe6f23754abc6a8d183b5a28ffaad23"
        
        return "http://api.openweathermap.org/data/2.5/forecast?q=\(city)&APPID=\(testKey)&lang=\(lang)"
    }
}


