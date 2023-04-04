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
import CoreLocation

class GlobalProvider{
    
    
    private let decoder = JSONDecoder()
    
    private let testKey = "bfe6f23754abc6a8d183b5a28ffaad23"
    
    private let lang = "ua"
    
    
    
    func getWeather(city: String) -> Observable<WeatherResponce> {
        print("request: \(getUrl(city: city))")
        return getWeather<WeatherResponce>(request: getUrl(city: city))
    }
    
    func getWeather(coords: CLLocationCoordinate2D) -> Observable<List> {
        print("request: \(getUrl(coords: coords))")
        return getWeather<List>(request: getUrl(coords: coords))
    }

    private func getWeather<T: Decodable>(request: String) -> Observable<T> {
        return Observable<T>.create { observer -> Disposable in
            let request = AF
                        .request(request)
                        .validate()
                        .responseJSON { response in
                            
                            switch response.result {
                            case .success(_):
                                
                                if let data = response.data {
                                    do {
                                        let result =  try self.decoder.decode(T.self, from: data)
                                        observer.onNext(result)
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
                        }
     
            
            return Disposables.create(with: {
                request.cancel()
            })
        }
    }
    

    
    private func getUrl(coords: CLLocationCoordinate2D) -> String{
        return "https://api.openweathermap.org/data/2.5/weather?lat=\(coords.latitude)&lon=\(coords.longitude)&APPID=\(testKey)&lang=\(lang)"
    }
    
    private func getUrl(city: String)-> String{
        return "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&APPID=\(testKey)&lang=\(lang)"
    }
}




