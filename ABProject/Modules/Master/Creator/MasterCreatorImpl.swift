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
        
        
        let globalProvider = GlobalProvider()
        let presenter = MasterPresenterImpl()
        let interactor = MasterInteratorImpl(provider: globalProvider)
        let masterCreator = MasterCreatorImpl()
        
        
        let navigation = UINavigationController(rootViewController: view)
        
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.creator = masterCreator
        
        view.presenter = presenter
        masterCreator.viewController = view
        
        return navigation
    }
    
}
