//
//  Resto.swift
//  MobiDevApp
//
//  Created by Hadil on 3/10/19.
//  Copyright © 2019 Hadil. All rights reserved.
//

import Foundation
struct Resto {
    var adresse: String?
    var nom: String?
    var lat: Double = 0.0
    var lng: Double = 0.0
    var open: Bool = false
    var image: String?
    
    //constructor of Resto
    init(withDictionary json: [String: Any?]) {
        self.adresse = json["formatted_address"] as? String
        self.nom = json["name"] as? String
        
        if let openingHours=json["opening_hours"] as? [String:Any?], let open=openingHours["open_now"] as? Bool{
            self.open=open
        }
        
        if let geo=json["geometry"] as? [String:Any?] , let loc=geo["location"] as? [String:Any?] , let lat =  loc["lat"] as? Double,let lng =  loc["lng"] as? Double {
            self.lat = lat
            self.lng=lng
        }
        
        if let photos=json["photos"] as? [[String:Any?]] ,let image = photos[0]["photo_reference"] as? String {
            self.image = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=300&photoreference=\(image)&key=AIzaSyBIelnCo8rWqvpvyoNf0WOxM_DVBQzf8Fo"
        }
        
        
    }
}

