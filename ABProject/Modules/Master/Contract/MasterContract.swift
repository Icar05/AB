//
//  MasterContract.swift
//  ABProject
//
//  Created by Eddson on 29.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import UIKit

protocol MasterPresenter: AnyObject {
    var view: MasterView? { get set }
    var interactor: MasterInteractor! { get set }
    func onViewDidLoad()
}

protocol MasterInteractor: AnyObject {}

protocol MasterView: AnyObject {
    var presenter: MasterPresenter! { get set }
}



