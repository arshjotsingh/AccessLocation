//
//  ViewController.swift
//  AccessLocation
//
//  Created by Student on 2016-02-02.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    @IBOutlet weak var labelLatitude: UILabel!
   

    @IBOutlet weak var labeLongitude: UILabel!
    @IBOutlet weak var labelCourse: UILabel!
    @IBOutlet weak var labelSpeed: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var Date: UILabel!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "Access Location"
    
       // self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
      //  self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        
    }
    
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedAlways || status == .AuthorizedWhenInUse
        {
         locationManager.startUpdatingLocation()
        }
        else
        {
            self.locationManager.requestAlwaysAuthorization()
            
//            // For use in foreground
//            self.locationManager.requestWhenInUseAuthorization()

        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Found user's location: \(location)")
            
            let userLocation:CLLocation = locations[0] as! CLLocation
            let long = userLocation.coordinate.longitude;
            let lat = userLocation.coordinate.latitude;
            
            
            let longitude = String(long)
            labeLongitude.text = longitude
            
            let latitude = String(lat)
            labelLatitude.text = latitude
            
            var speed = String(userLocation.speed)
            speed += " mps"
            
            labelSpeed.text = speed
            
            labelCourse.text = String(userLocation.course)
            
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
//    func locationManager(manager: CLLocationManager,
//        didChangeAuthorizationStatus status: CLAuthorizationStatus)
//    {
//            manager.startUpdatingLocation()
//            print(manager.location?.coordinate.latitude)
//        
//    }
    
   
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    

}

