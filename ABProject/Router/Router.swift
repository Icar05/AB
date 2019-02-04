//
//  Router.swift
//  ABProject
//
//  Created by Eddson on 29.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import UIKit


/*
    class that will route to entity
 */
class Router {
    
    
    
    // show master
    static func presentRootScreen(in window: UIWindow!){
        window.makeKeyAndVisible()
        window.rootViewController = MasterCreatorImpl.assembleModule()
    }
    
    //navigate to master
    static func presentMainScreen(current: UIViewController?) {
        let masterController = MasterCreatorImpl.assembleModule()
        current?.navigationController?.present(masterController, animated: true)
    }
    
    
    //navigate to master
    static func presentDetailScreen(current: UIViewController?, city: String) {
        let detailController : DetailViewController = DetailCreatorImpl.assembleModule() as! DetailViewController
        detailController.city = city
        current?.navigationController?.pushViewController(detailController, animated: true)
    }
    
    
}
