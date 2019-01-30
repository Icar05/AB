//
//  MasterPresenter.swift
//  ABProject
//
//  Created by Eddson on 29.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import RxSwift


class MasterPresenterImpl: MasterPresenter {
    
    weak var view: MasterView?
    
    var interactor: MasterInteractor!
    
    var creator: MasterCreator!
    
    private var disposeBag = DisposeBag()
    
    
    func viewDidLoad() {
        
        interactor.getWeatcher()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (n) in
                 
            }, onError: { (error) in
              
            }, onCompleted: {
            
            }, onDisposed: {
                
            }).disposed(by: disposeBag)
        
    }
    

    
}
