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
