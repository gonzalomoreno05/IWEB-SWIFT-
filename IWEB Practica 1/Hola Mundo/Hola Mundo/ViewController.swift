//
//  ViewController.swift
//  Hola Mundo
//
//  Created by g834 DIT UPM on 13/9/18.
//  Copyright © 2018 g834. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var Slider: UISlider!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func updateSol(_ sender: UIButton) {
        
        let center = CLLocationCoordinate2D(latitude: 40.4167278, longitude: -3.7033387)
        let span = MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
        let reg = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(reg, animated: true)    }
    
    

    
    @IBAction func updateHola(_ sender: UIButton) {
        msgLabel.text = "Hola"
        Slider.value = 0.5
        let center = CLLocationCoordinate2D(latitude: 40.69, longitude: -74.0450)
        let span = MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
        let reg = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(reg, animated: true)
        mapView.mapType = MKMapType.hybrid
    }
    
    @IBAction func updateMundo(_ sender: UIButton) {
        msgLabel.text = "Mundo"
        
        let center = CLLocationCoordinate2D(latitude: 40.452445, longitude: -3.726162)
        let span = MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
        let reg = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(reg, animated: true)
        mapView.mapType = MKMapType.satellite
            }
    

    
    @IBAction func valueAlpha(_ sender: UISlider) {
        msgLabel.alpha = CGFloat(sender.value)
        
    }
    




}

