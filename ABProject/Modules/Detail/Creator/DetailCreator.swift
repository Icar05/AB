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
class DetailCreatorImpl: BaseCreator {
    
    
    
    
    static func getControllerIndifier() -> String {
        return "DetailViewController"
    }
    
    static func getStoryBoardName() -> String {
         return "Detail"
    }
    
    
    
    static func assembleModule() -> UIViewController {
        
        let view = getSelfUIViewController() as! DetailViewController
        
        let presenter = DetailPresenterImpl()
        let interactor = DetailInteractorImpl()
    
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
     
    
        
        return view
    }
}
