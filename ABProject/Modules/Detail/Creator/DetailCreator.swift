//
//  DetailCreator.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import UIKit

/*
 detail
 */
class DetailCreatorImpl: DetailCreator {
    
    
    func printModel(model: RootClass) {
        
    }
    
    
    static let named = "Detail"
    
    static let indifier = "DetailViewController"
    
    
    weak var viewController: UIViewController?
    
    
    
    static func assembleModule() -> UIViewController {
        
        let view = UIStoryboard(name: named, bundle: nil)
            .instantiateViewController(withIdentifier: indifier) as! DetailViewController
        
        
        
        let presenter = DetailPresenterImpl()
        let interactor = DetailInteractorImpl()
        let masterCreator = DetailCreatorImpl()
                
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.creator = masterCreator
        
        masterCreator.viewController = view
        
        return view
    }
}
