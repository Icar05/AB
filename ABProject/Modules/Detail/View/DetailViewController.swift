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
    
    
    
    private var annotation = MKPointAnnotation()
    
    private let geoCoder = CLGeocoder()
    
    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var loader: UILoadingView!
    
    var presenter: DetailPresenter!
    
    var city: String?

    var datasource: [List] = []
    
    let indifier = "collectionCell"
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = city
        
        presenter.viewDidLoad()
        presenter.loadWeather(city: city!)
        presenter.getLocationByCityName(city: city!)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setupMapViewClick()
    }
    
    
    private func setupMapViewClick(){
        let regognizer = UITapGestureRecognizer(target: self, action: #selector(mapDidTap(sender:)))
        self.map.addGestureRecognizer(regognizer)
    }
    
    
    
    @objc func mapDidTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            guard let coordinate = map?.convert(sender.location(in: map), toCoordinateFrom: map) else {
                return
            }
            
            
            self.getLocationName(location: coordinate, callback: {
                self.showMarker(location: coordinate, title: $0)
                self.presenter.loadWeather(coords: coordinate)
            })
            
            
        }
    }
    
}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    
    func showLocationOnMap(location: CLLocationCoordinate2D) {
        self.showMarker(location: location, title: city!)
        self.zoomToMarker(location: location)
    }
    
    func showErrorLocation(value: String) {
        let actionSheet  = UIAlertController(
            title: "Ошибка определения локации",
            message: "Ну удалось найти координаты \(city!)",
            preferredStyle: .actionSheet
        )
            actionSheet.addAction(UIAlertAction(title: "Ok" , style: .cancel, handler: {_ in
                self.navigationController?.popViewController(animated: true)
            }))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width + 1, height:CGFloat(collectionView.bounds.size.height))
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indifier , for: indexPath) as! UIWeatherCellCollectionViewCell
            cell.createCell(item: datasource[indexPath.row])
            return cell
    }
    
    
    func getLocationName(location: CLLocationCoordinate2D, callback: @escaping (String) -> Void){
     
        let location = CLLocation(latitude: location.latitude, longitude: location.longitude)
        self.geoCoder.reverseGeocodeLocation(location, completionHandler: { placemarks, error -> Void in

            guard let placeMark = placemarks?.first else {
                callback("Unknown")
                return
            }

            if let city = placeMark.subAdministrativeArea {
                callback(city)
                 return
            }
                

            if let country = placeMark.country {
               callback(country)
                return
            }
            
        })
    }
    
}

extension DetailViewController: DetailView{
    
    func showMarker(location: CLLocationCoordinate2D, title: String){
        
        self.map?.removeAnnotations(self.map?.annotations ?? [])

        self.annotation.title = title
        self.annotation.subtitle = "Место: \(title)"
        self.annotation.coordinate = location
        
        self.map?.addAnnotation(annotation)
    }
    
    
    func zoomToMarker(location: CLLocationCoordinate2D){
        let span = MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)
        let region = MKCoordinateRegion(center: location,span: span)
        
        self.map?.setRegion(region, animated: true)
    }
    
    func showErrorScreen(error: String) {
        loader.showError(value: error)
        collectionView.isHidden = true
        map?.isHidden = true
    }
    
    func showNoContentScreen() {
        loader.showEmptyView()
    }
    
    
    func showLoading() {
        loader.showLoading()
    }
    
    func showResultScreen(result: [List]) {
        
        if let name = result.first?.name {
            annotation.title = name
            title = name
        }
        
        loader.isHidden = true
        datasource = result
        collectionView.reloadData()
        collectionView.isHidden = false
        map?.isHidden = false
    }
}
