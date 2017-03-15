//
//  ViewController.swift
//  TestRoute
//
//  Created by Hoff Silva on 15/03/17.
//  Copyright © 2017 Hoff Silva. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!

    @IBOutlet weak var tfLatFrom: UITextField!
    
    @IBOutlet weak var tfLongFrom: UITextField!
    
    @IBOutlet weak var tfLatTo: UITextField!
    
    @IBOutlet weak var tfLongTo: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tfLatTo.delegate = self
        tfLongTo.delegate = self
        tfLatFrom.delegate = self
        tfLongFrom.delegate = self
        mapView.delegate = self
        
        //-15.787857, -47.881774
        tfLatTo.text = "-15.787857"
        tfLongTo.text = "-47.881774"
        
        //-15.779906, -47.890257
        tfLatFrom.text = "-15.779906"
        tfLongFrom.text = "-47.890257"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func calculateRoute(_ sender: Any) {
        
        
        
        
        
        var coordinateFrom = CLLocationCoordinate2D(latitude: Double(tfLatFrom.text!)!, longitude: Double(tfLongFrom.text!)!)
        
        var placeMarkFrom = MKPlacemark(coordinate: coordinateFrom)
        
        var mapItemFrom = MKMapItem(placemark: placeMarkFrom)
        
        
        var coordinateTo = CLLocationCoordinate2D(latitude: Double(tfLatTo.text!)!, longitude: Double(tfLongTo.text!)!)
        
        var placeMarkTo = MKPlacemark(coordinate: coordinateTo)
        
        var mapItemTo = MKMapItem(placemark: placeMarkTo)
        
        
        let request = MKDirectionsRequest()
        
        request.source = mapItemFrom
        
        request.destination = mapItemTo
        
        request.requestsAlternateRoutes = true
        
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        
        directions.calculate { (result, error) in
            if let success = result?.routes{
                let quickestRoute = success.sorted(by: { (routeA: MKRoute, routeB: MKRoute) -> Bool in
                    return routeA.expectedTravelTime < routeB.expectedTravelTime
                }).first
                
                self.mapView.add((quickestRoute?.polyline)!)
                self.mapView.setVisibleMapRect((quickestRoute?.polyline.boundingMapRect)!, edgePadding: UIEdgeInsetsMake(10, 10, 10, 10), animated: true)
                
            }else{
                
                print("Erro!")
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let paintedRoute = MKPolylineRenderer(overlay: overlay)
        
        if (overlay is MKPolyline) {
            paintedRoute.strokeColor = UIColor.blue
            paintedRoute.lineWidth = 2
            
        }
        return paintedRoute
        
    }
    
    


}

