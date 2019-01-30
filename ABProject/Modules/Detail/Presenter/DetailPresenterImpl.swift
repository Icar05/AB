//
//  DetailPresenterImpl.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation

class DetailPresenterImpl: DetailPresenter{
    
    weak var view: DetailView?
    var interactor: DetailInteractor!
    var creator: DetailCreator!
    
    
    func viewDidLoad() {
        interactor.fetchArticles()
    }
    
}
