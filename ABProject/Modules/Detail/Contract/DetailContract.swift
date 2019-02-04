//
//  DetailContract.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol DetailCreator: class {
    var viewController: UIViewController? { get set }
    
    func printModel(model: RootClass)
    
    static func assembleModule() -> UIViewController
}

protocol DetailPresenter: class {
    var view: DetailView? { get set }
    var interactor: DetailInteractor! { get set }
    var creator: DetailCreator! { get set }
    
    func loadWeather(city: String)
    func viewDidLoad()
}

protocol DetailInteractor: class {
    var globalProvider: GlobalProvider! {get set}
    func getWeatcher(city: String) -> Observable<[List]>
}

protocol DetailView: class {
    var presenter: DetailPresenter! { get set }
    
    func showNoContentScreen()
    func showLoading()
    func showErrorScreen(error: String)
    func showResultScreen(result: [List])
    
}
