//
//  DetailContract.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation

import RxSwift
import MapKit

protocol DetailCreator: AnyObject {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController
}

protocol DetailPresenter: AnyObject {
    var view: DetailView? { get set }
    var interactor: DetailInteractor! { get set }
    
    func getLocationByCityName(city: String)
    func loadWeather(city: String)
    func loadWeather(coords: CLLocationCoordinate2D)
    func viewDidLoad()
}

protocol DetailInteractor: AnyObject {
    var  globalProvider: GlobalProvider! {get set}
    var  locationUtil: LocationUtil! {get set}
    func getWeatcher(city: String) -> Observable<WeatherResponce>
    func getWeatcher(coords: CLLocationCoordinate2D) -> Observable<List>
    func getLocationByCityName(city: String) -> Observable<CLLocationCoordinate2D>
}

protocol DetailView: AnyObject {
    var presenter: DetailPresenter! { get set }
    
    func showNoContentScreen()
    func showLoading()
    func showErrorScreen(error: String)
    func showResultScreen(result: [List])
    func showLocationOnMap(location: CLLocationCoordinate2D)
    func showErrorLocation(value: String)
    
}
