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
    
    
    private var disposeBag = DisposeBag()
    
    
    func onViewDidLoad() {
        
        interactor.getWeatcher()
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (n) in
                    print(n.count)
            }, onError: { (error) in
                    print(error)
            }, onCompleted: {
                print("onCompleted")
            }, onDisposed: {
                print("onDisposed")
            }).disposed(by: disposeBag)
        
    }
    

    
}
