//
//  MasterCreator.swift
//  ABProject
//
//  Created by Eddson on 29.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import UIKit

class MasterCreatorImpl:   BaseCreator {
    
    
    
    
    
    static func getControllerIndifier() -> String {
        return "MasterViewController"
    }
    
    static func getStoryBoardName() -> String {
        return "M"
    }
    
    
    static func assembleModule() -> UIViewController {
        
        let view = getSelfUIViewController() as! MasterViewController
        

        let presenter = MasterPresenterImpl()
        let interactor = MasterInteratorImpl()
       
        let navigation = UINavigationController(rootViewController: view)
        
        
        presenter.view = view
        presenter.interactor = interactor
    
        view.presenter = presenter
      
        
        return navigation
    }
    
}
