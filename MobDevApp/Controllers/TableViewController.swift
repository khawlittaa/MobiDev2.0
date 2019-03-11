//
//  TableViewController.swift
//  MobiDevApp
//
//  Created by Hadil on 3/10/19.
//  Copyright © 2019 Hadil. All rights reserved.
//

import UIKit
import CoreLocation
import  Alamofire

class TableViewController: UIViewController , CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Attributs
    @IBOutlet weak var TableViewRestaurants: UITableView!
    
    var locationManager:CLLocationManager!
    var latitude = 0.0
    var longitude = 0.0
    var Restaus: [Resto] = []
    
    //MARK: life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TableViewRestaurants.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.TableViewRestaurants.allowsSelection = false
        TableViewRestaurants.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
        determineMyCurrentLocation()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Restaus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let resto: Resto = Restaus[indexPath.row]
        
        let x = (resto.open==true) ? "ouvert" : "fermé"
        
        let text = resto.nom!+" \nAdresse: "+resto.adresse!+"\nLocation: \(resto.lat),\(resto.lng) "+"\n"+x
         cell.latitude = resto.lat
        cell.longitude = resto.lng
        cell.labelText.text=text
        cell.imageResto.setImage(url: resto.image)
        
        return cell
    }
    
    
    //MARK: public methods
    
    func  determineMyCurrentLocation(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
        locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let  userLocation:CLLocation = locations[0]
        locationManager.stopUpdatingLocation()
        
        if latitude==0.0 && longitude==0.0{
            latitude=userLocation.coordinate.latitude
            longitude=userLocation.coordinate.longitude
            
            let myapi="https://maps.googleapis.com/maps/api/place/textsearch/json?location=\(latitude),\(longitude)&radius=1600&query=restaurants&key=AIzaSyBIelnCo8rWqvpvyoNf0WOxM_DVBQzf8Fo"
            
            WebService.AlamofireRequest(url: myapi,getRest: self.reloadRestaus)
        }
    }
    
    func reloadRestaus(restaut : [Resto], success : Bool) {
        if success == true{
            print("Resto = \(restaut.count)")
            self.Restaus = restaut
            self.TableViewRestaurants.reloadData()
        }else{
            let alert = UIAlertController(title: "Warning", message: "Nothing to show", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: { (action) in
                alert.dismiss(animated: true,completion: nil)
                
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("Error \(error)")
    }
    
    
    
    
}
