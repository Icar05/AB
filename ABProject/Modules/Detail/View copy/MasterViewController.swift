//
//  MasterView.swift
//  ABProject
//
//  Created by Eddson on 29.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import UIKit

class MasterViewController: UIViewController{
    
    var presenter: MasterPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
}

extension MasterViewController: MasterView{
    
    
    func showNoContentScreen() {
        
    }
    
    func showHelloData(_ data: Model) {
        
    }
}
