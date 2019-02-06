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

class GlobalProvider{
    
    
    
    
    
    

    func getWeather(city: String) -> Observable<[List]> {
        
        return Observable<[List]>.create { observer -> Disposable in
            
            let keyList = "list"
            
            let request = Alamofire
                        .request(self.getUrl(city: city))
                        .validate()
                        .responseJSON { response in
                            
                            let value:  [String:Any]?  = response.result.value as? [String:Any]
                    
                                if let listValues =  value?[keyList] {
                      
                                    let decoder = JSONDecoder()
                        
                                    if let data = try? JSONSerialization.data(withJSONObject: listValues as Any , options:[]){
                                        do{
                                            let content:[List] = try decoder.decode([List].self, from: data)
                                                observer.onNext(content)
                                                observer.onCompleted()
                                          }catch let er as NSError{
                                                observer.onError(er)
                                          }
                                    }else{
                                        let error : NSError = NSError(
                                            domain: "GlobalProvider",
                                            code: -1,
                                            userInfo: [NSLocalizedDescriptionKey:"error while serialization"])
                                        
                                            observer.onError(error)
                                    }
                                } else{
                                        let error : NSError = NSError(
                                            domain: "GlobalProvider",
                                            code: -1,
                                            userInfo: [NSLocalizedDescriptionKey:"Под данному запросу нету информации"])
                                
                                            observer.onError(error)
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
        
        return "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&APPID=\(testKey)&lang=\(lang)"
    }
}




