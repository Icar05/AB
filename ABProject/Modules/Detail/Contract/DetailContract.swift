//
//  DetailContract.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import UIKit

protocol DetailCreator: class {
    var viewController: UIViewController? { get set }
    
    func printModel(model: Model)
    
    static func assembleModule(model: Model) -> UIViewController
}

protocol DetailPresenter: class {
    var view: DetailView? { get set }
    var interactor: DetailInteractor! { get set }
    var creator: DetailCreator! { get set }
    
    func viewDidLoad()
}

protocol DetailInteractor: class {
    func fetchArticles()
}

protocol DetailView: class {
    var presenter: DetailPresenter! { get set }
    
    func showNoContentScreen()
    func showHelloData(_ data: Model)
}
