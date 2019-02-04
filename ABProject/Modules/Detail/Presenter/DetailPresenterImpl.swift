//
//  DetailPresenterImpl.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import RxSwift

class DetailPresenterImpl: DetailPresenter{
  
    
    weak var view: DetailView?
    
    var interactor: DetailInteractor!
    
    var creator: DetailCreator!
    
    private var disposeBag = DisposeBag()
    
    
    func viewDidLoad() {
      
    }
    
    func loadWeather(city: String) {
        view?.showLoading()
        interactor.getWeatcher(city: city)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (n) in
                print("onNext")
                self.view?.showResultScreen(result: n)
               
            }, onError: { (error) in
                print("onError "+error.localizedDescription)
                self.view?.showNoContentScreen()
                
            }, onCompleted: {
                print("onCompleted")
            }, onDisposed: {
                print("onDisposed")
            }).disposed(by: disposeBag)
    }
    
}
