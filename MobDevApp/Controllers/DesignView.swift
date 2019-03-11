//
//  DesignView.swift
//  MobiDevApp
//
//  Created by Hadil on 3/10/19.
//  Copyright © 2019 Hadil. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class DesignView : UIView{
    @IBInspectable var cornerRadius: CGFloat = 20
    
    override func layoutSubviews() {
        layer.cornerRadius=cornerRadius
    }
}
