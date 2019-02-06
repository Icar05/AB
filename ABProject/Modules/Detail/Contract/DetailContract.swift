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

protocol DetailCreator: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController
}

protocol DetailPresenter: class {
    var view: DetailView? { get set }
    var interactor: DetailInteractor! { get set }
    
    func getLocationByCityName(city: String)
    func loadWeather(city: String)
    func viewDidLoad()
}

protocol DetailInteractor: class {
    var  globalProvider: GlobalProvider! {get set}
    var  locationUtil: LocationUtil! {get set}
    func getWeatcher(city: String) -> Observable<[List]>
    func getLocationByCityName(city: String) -> Observable<CLLocationCoordinate2D>
}

protocol DetailView: class {
    var presenter: DetailPresenter! { get set }
    
    func showNoContentScreen()
    func showLoading()
    func showErrorScreen(error: String)
    func showResultScreen(result: [List])
    func showLocationOnMap(location: CLLocationCoordinate2D)
    func showErrorLocation(value: String)
    
}
