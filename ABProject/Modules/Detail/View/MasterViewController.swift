//
//  MasterControllerViewController.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    
    var presenter: MasterPresenter!
    
    @IBAction func goToDetail() {
        Router.presentDetailScreen(current: self, model: Model())
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}


extension MasterViewController : MasterView{
    
    func showNoContentScreen() {
        
    }
    
    func showHelloData(_ data: Model) {
     
    }
    
    
}
