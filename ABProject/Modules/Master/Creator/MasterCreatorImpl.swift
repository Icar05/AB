//
//  MasterCreator.swift
//  ABProject
//
//  Created by Eddson on 29.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import UIKit

class MasterCreatorImpl:   MasterCreator {
    
    static let named = "M"
    
    static let indifier = "MasterViewController"
    
    
    func showHello() {print("hello")}
    
    
    weak var viewController: UIViewController?
    
    
    
    static func assembleModule() -> UIViewController {
        
        let view = UIStoryboard(name: named, bundle: nil)
            .instantiateViewController(withIdentifier: indifier) as! MasterViewController
        
        
        let presenter = MasterPresenterImpl()
        let interactor = MasterInteratorImpl()
        let masterCreator = MasterCreatorImpl()
        let globalProvider = GlobalProvider()
        
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter = presenter
        interactor.globalProvider = globalProvider
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.creator = masterCreator
        
        masterCreator.viewController = view
        
        return navigation
    }
    
}
