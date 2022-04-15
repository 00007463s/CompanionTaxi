//
//  MapViewController.swift
//  Companion Taxi
//
//  Created by Malika on 13/04/22.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    let backButton = UIButton()
    
    var latitude = CGFloat()
    var longitude = CGFloat()
    var region = ""

    
    init(latitude: CGFloat, longitude: CGFloat, region: String){
        super.init(nibName: nil, bundle: nil)
        self.latitude = latitude
        self.longitude = longitude
        self.region = region
        
        appearenceSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    func appearenceSettings(){
        backButton.setImage(UIImage(named: "back"), for: .normal)
        self.view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).offset(10)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }

        backButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        
        let camera = GMSCameraPosition.camera(withLatitude: self.latitude, longitude: self.longitude, zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
        

        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        marker.title = self.region
        marker.snippet = "Uzbekistan"
        marker.map = mapView
        
        self.view.bringSubviewToFront(backButton)
    }
    
    
    @objc func dismissVC(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
