//
//  UIImageViewExtension.swift
//  MobiDevApp
//
//  Created by Hadil on 3/10/19.
//  Copyright © 2019 Hadil. All rights reserved.
//
import Foundation
import UIKit
import SDWebImage


extension UIImageView {
    
    
    func setImage(url : String? /*, placeholder : String? , type : ImageType*/){
        
        self.sd_setImage(with: URL(string: url ?? ""), placeholderImage: #imageLiteral(resourceName: "holder"))
       
    }
    
}
