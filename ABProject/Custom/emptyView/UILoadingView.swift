//
//  UILoadingView.swift
//  ABProject
//
//  Created by Ipinguin_linuxoid on 2019/02/05.
//  Copyright © 2019 Eddson. All rights reserved.
//

import UIKit


@IBDesignable
class UILoadingView: UIView {

    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    func showLoading(){
        loading.isHidden = false
        loading.startAnimating()
        label.isHidden = true
    }
    
    
    func showEmptyView(){
        loading.stopAnimating()
        loading.isHidden = true
        label.isHidden = true
    }
    
    
    func showError(value: String){
         loading.stopAnimating()
         loading.isHidden = true
         label.isHidden = false
         label.text = value
    }
    
    
    func setup() {
        
        let bundle = Bundle(for: UILoadingView.self)
        bundle.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask =
            [UIView.AutoresizingMask.flexibleWidth,
             UIView.AutoresizingMask.flexibleHeight]
        
        
//        label.textColor = color
//        loading.color = color
    }

}
