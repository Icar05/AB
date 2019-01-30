//
//  MasterContract.swift
//  ABProject
//
//  Created by Eddson on 29.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import UIKit

protocol MasterCreator: class {
    var viewController: UIViewController? { get set }
    
    func showHello()
    
    static func assembleModule() -> UIViewController
}

protocol MasterPresenter: class {
    var view: MasterView? { get set }
    var interactor: MasterInteractor! { get set }
    var creator: MasterCreator! { get set }

    func viewDidLoad()
}

protocol MasterInteractor: class {
    func fetchArticles()
}

protocol MasterView: class {
    var presenter: MasterPresenter! { get set }
    
    func showNoContentScreen()
    func showHelloData(_ data: Model)
}



