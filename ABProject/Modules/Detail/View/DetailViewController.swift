//
//  DetailViewController.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var loader: UILoadingView!
    
    var presenter: DetailPresenter!
    
    var city: String?

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        presenter.loadWeather(city: city!)
    }
    

}

extension DetailViewController : DetailView{
    
    
    
    func showErrorScreen(error: String) {
        loader.showError(value: error)
    }
    
    
    func showNoContentScreen() {
        loader.showEmptyView()
    }
    
    
    func showLoading() {
        loader.showLoading()
    }
    
    func showResultScreen(result: [List]) {
        loader.showError(value: "Count of results -> \(result.count)")
    }
    

    
}
