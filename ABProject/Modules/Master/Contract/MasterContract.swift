//
//  MasterContract.swift
//  ABProject
//
//  Created by Eddson on 29.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import UIKit

protocol MasterPresenter: class {
    var view: MasterView? { get set }
    var interactor: MasterInteractor! { get set }
    func onViewDidLoad()
}

protocol MasterInteractor: class {
    
}

protocol MasterView: class {
    var presenter: MasterPresenter! { get set }
}



