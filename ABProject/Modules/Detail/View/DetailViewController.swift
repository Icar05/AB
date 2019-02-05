//
//  DetailViewController.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import UIKit
import MapKit
import GLKit

class DetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var map: MKMapView!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var loader: UILoadingView!
    
    var presenter: DetailPresenter!
    
    var city: String?

    var datasource: [List] = []
    
    let indifier = "collectionCell"
    
    let distance: CLLocationDistance = 650
    
    let pitch: CGFloat = 65
    
    let heading = 0.0
    
    var camera: MKMapCamera?
    
    let coordinate = CLLocationCoordinate2D(latitude: 12.8692,longitude: -85.1412)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        presenter.loadWeather(city: city!)
        collectionView.dataSource = self
        moveCamera(coordinate: coordinate)
    }
    

}

extension DetailViewController : DetailView, UICollectionViewDataSource{
    
    
    
    func moveCamera(coordinate: CLLocationCoordinate2D){
        map?.mapType = .satelliteFlyover
        
        
        camera = MKMapCamera(lookingAtCenter: coordinate,
                             fromDistance: distance,
                             pitch: pitch,
                             heading: heading)
        
        map?.camera = camera!
    }
    
    
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: collectionView.bounds.size.width, height:       CGFloat(collectionView.bounds.size.height))
//    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indifier , for: indexPath) as! UIWeatherCellCollectionViewCell
            cell.createCell(item: datasource[indexPath.row])
            return cell
    }
    
    
    func showErrorScreen(error: String) {
        loader.showError(value: error)
        collectionView.isHidden = true
        map?.isHidden = true
    }
    
    
    func showNoContentScreen() {
        loader.showEmptyView()
        collectionView.isHidden = true
        map?.isHidden = true
    }
    
    
    func showLoading() {
        loader.showLoading()
        collectionView.isHidden = true
        map?.isHidden = true
    }
    
    func showResultScreen(result: [List]) {
        loader.isHidden = true
        
        self.datasource = result
        collectionView.reloadData()
        
        collectionView.isHidden = false
        map?.isHidden = false
    }
    

    
}
