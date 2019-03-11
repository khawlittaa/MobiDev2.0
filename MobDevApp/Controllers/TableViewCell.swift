//
//  TableViewCell.swift
//  MobiDevApp
//
//  Created by Hadil on 3/10/19.
//  Copyright © 2019 Hadil. All rights reserved.
//
import UIKit
import MapKit

class TableViewCell: UITableViewCell {
    
    //declaration des variables
    var latitude = 0.0
    var longitude = 0.0
    @IBOutlet weak var imageResto: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var mapButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //design outlets
    override func draw(_ rect: CGRect) {
        mapButton.layer.cornerRadius = mapButton.frame.height/2
        imageResto.layer.cornerRadius = 20
    
    }
    //selectionner une cellule
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    //Acces au Map
    @IBAction func openMaps(_ sender: Any) {
        
        let latitude: CLLocationDegrees = self.latitude
        let longitude: CLLocationDegrees = self.longitude
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Place Name"
        mapItem.openInMaps(launchOptions: options)
    }
    
    
}

