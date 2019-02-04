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
    
    var city: String?

    @IBOutlet weak var emptyView: UILabel!
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        presenter.loadWeather(city: city!)
    }
    

}

extension DetailViewController : DetailView{
    
    
    func showNoContentScreen() {
        loader?.isHidden = true
        loader?.stopAnimating()
        emptyView?.isHidden = false
    }
    
    
    func showLoading() {
        loader?.isHidden = false
        loader?.startAnimating()
        emptyView?.isHidden = true
    }
    
    func showResultScreen(result: [List]) {
        loader?.isHidden = true
        loader?.stopAnimating()
        emptyView?.isHidden = false
    }
    

    
}
