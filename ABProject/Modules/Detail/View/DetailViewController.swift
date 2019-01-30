//
//  DetailViewController.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    

}

extension DetailViewController : DetailView{

    func showNoContentScreen() {
        
    }
    
    func showHelloData(_ data: RootClass) {
       
    }
    
    
}
