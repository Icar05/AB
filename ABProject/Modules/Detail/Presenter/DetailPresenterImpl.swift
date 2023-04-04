//
//  DetailPresenterImpl.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import RxSwift
import MapKit

class DetailPresenterImpl: DetailPresenter{
  
    

    
    weak var view: DetailView?
    
    var interactor: DetailInteractor!
    
    private var disposeBag = DisposeBag()
    
    
    
    
    
    func viewDidLoad() {}
    
    /*
        getLocation from city name
     */
    func getLocationByCityName(city: String) {
        interactor.getLocationByCityName(city: city)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { (n) in
                print("getLocationByCity -> onNext")
                self.view?.showLocationOnMap(location: n)
            }, onError: { (error) in
                print("getLocationByCity -> onError while get location -> \(error.localizedDescription)")
                self.view?.showErrorLocation(value: error.localizedDescription)
            }, onCompleted: {
                print("getLocationByCity -> onCompleted")
            }, onDisposed: {
                print("getLocationByCity -> onDisposed")
            }).disposed(by: disposeBag)
    }
    
    
    
    /*
      get weather data by city name
    */
    func loadWeather(city: String) {
        view?.showLoading()
        interactor.getWeatcher(city: city)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { (n) in
                print("loadWeather -> onNext")
                self.view?.showResultScreen(result: n)
            }, onError: { (error) in
                self.view?.showErrorScreen(error: error.localizedDescription)
            }, onCompleted: {
                print("loadWeather -> onCompleted")
            }, onDisposed: {
                print("loadWeather -> onDisposed")
            }).disposed(by: disposeBag)
    }
    
}
