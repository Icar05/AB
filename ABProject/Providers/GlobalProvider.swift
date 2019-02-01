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
    
    
    
    let keyList = "list"
    
    

    func getWeather(city: String) -> Observable<[List]> {
        
        return Observable<[List]>.create { observer -> Disposable in
            let request = Alamofire
                        .request(self.getUrl(city: city))
                        .validate()
                        .responseJSON { response in
                            
                            let value:  [String:Any]?  = response.result.value as? [String:Any]
                    
                                if let listValues =  value?[self.keyList] {
                      
                                    let decoder = JSONDecoder()
                        
                                    if let data = try? JSONSerialization.data(withJSONObject: listValues as Any , options:[]){
                                        do{
                                            let content:[List] = try decoder.decode([List].self, from: data)
                                                observer.onNext(content)
                                                observer.onCompleted()
                                          }catch let er as NSError{
                                                observer.onError(er)
                                          }
                                        }
                                }
                            
                        }
     
            
            return Disposables.create(with: {
                request.cancel()
            })
        }
    }
    

    
    
    private func getUrl(city: String)-> String{
        
        let lang = "ua"
        
        let testKey = "bfe6f23754abc6a8d183b5a28ffaad23"
        
        return "http://api.openweathermap.org/data/2.5/forecast?q=\(city)&APPID=\(testKey)&lang=\(lang)"
    }
}


