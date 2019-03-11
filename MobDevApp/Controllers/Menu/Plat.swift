//
//  Plat.swift
//  MobDevApp
//
//  Created by Admin on 3/10/19.
//  Copyright © 2019 khawla. All rights reserved.
//

import Foundation
import UIKit
class Plat{
    var name : String
    var monImage : String
    var description : String
    var type : String
    var calories : String
    var lipides : String
    var glucides : String
    var pourDiabetique : Bool
    var pourTension : Bool
    var prix : String
    
    init(name : String ,monImage : String, description : String ,type : String, calories : String, lipides : String
        , glucides : String ,prix : String,pourDiabetique : Bool,pourTension : Bool ){
        
        self.name = name
        self.monImage = monImage
        self.description = description
        self.type = type
        self.calories = calories
        self.lipides = lipides
        self.glucides = glucides
        self.prix = prix
        self.pourDiabetique = pourDiabetique
        self.pourTension = pourTension
    }
    
}
