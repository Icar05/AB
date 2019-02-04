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
//        navigationController?.navigationBar.backItem?.title = "Anything Else"
        
        
        
        presenter.viewDidLoad()
        presenter.loadWeather(city: city!)
    }
    

}

extension DetailViewController : DetailView{
    
    
    
    func showErrorScreen(error: String) {
        loader?.isHidden = true
        loader?.stopAnimating()
        emptyView?.isHidden = false
        emptyView?.text = error
    }
    
    
    
    func showNoContentScreen() {
        loader?.isHidden = true
        loader?.stopAnimating()
        emptyView?.isHidden = false
        emptyView?.text = "No data"
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
        
        
        //todo remove
        emptyView?.text = "Count of results -> \(result.count)"
    }
    

    
}
