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
    
    
    private let decoder = JSONDecoder()
    
    
    

    func getWeather(city: String) -> Observable<[List]> {
        
        return Observable<[List]>.create { observer -> Disposable in
            
            let keyList = "list"
            
            let request = AF
                        .request(self.getUrl(city: city))
                        .validate()
                        .responseJSON { response in
                            
                            switch response.result {
                            case .success(_):
                                
                                if let data = response.data {
                                    do {
                                        let result =  try self.decoder.decode(WeatherResponce.self, from: data)
                                        observer.onNext(result.list)
                                        observer.onCompleted()
                                    } catch {
                                        observer.onError(error)
                                    }
                                }else{
                                    let error : NSError = NSError(
                                        domain: "GlobalProvider",
                                        code: -1,
                                        userInfo: [NSLocalizedDescriptionKey:"Empty data from server"]
                                    )
                    
                                        observer.onError(error)
                                }
                                
                            case .failure(let error):
                                observer.onError(error)
                            }
                        
                            
                            
                            
                            
                    
//                                if let listValues =  value?[keyList] {
//
//
//
//                                    if let data = try? JSONSerialization.data(withJSONObject: listValues as Any , options:[]){
//                                        do{
//                                            let content:[List] = try decoder.decode([List].self, from: data)
//                                                observer.onNext(content)
//                                                observer.onCompleted()
//                                          }catch let er as NSError{
//                                                observer.onError(er)
//                                          }
//                                    }else{
//
//                                    }
//                                } else{
//                                        let error : NSError = NSError(
//                                            domain: "GlobalProvider",
//                                            code: -1,
//                                            userInfo: [NSLocalizedDescriptionKey:"Под данному запросу нету информации"])
//
//                                            observer.onError(error)
//                                }
//
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




