//
//  BaseContract.swift
//  ABProject
//
//  Created by Ipinguin_linuxoid on 2019/02/02.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import UIKit

protocol BaseCreator {
    static func assembleModule() -> UIViewController
    static func getControllerIndifier() -> String
    static func getStoryBoardName() -> String
}

extension BaseCreator{
    static func getSelfUIViewController() -> UIViewController{
        let view = UIStoryboard(name: getStoryBoardName(), bundle: nil)
            .instantiateViewController(withIdentifier: getControllerIndifier())
        
        return view
    }
}
