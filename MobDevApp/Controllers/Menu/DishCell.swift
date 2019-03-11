//
//  DishCell.swift
//  MobDevApp
//
//  Created by Admin on 3/10/19.
//  Copyright © 2019 khawla. All rights reserved.
//

import UIKit

class DishCell: UITableViewCell {
    @IBOutlet weak var CellView: UIView!
    @IBOutlet weak var dishPrice: UILabel!
    
    @IBOutlet weak var DishType: UILabel!
    @IBOutlet weak var DishName: UILabel!
    @IBOutlet weak var DishImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none

    
    }

    func  Updatcell(Name: String, Type: String, Img: String, price: String){
        DishType.text = Type
        dishPrice.text = price
        DishName.text = Name
        DishImg.image = UIImage(named: Img)
    }
    
    func setCorners (){
        // adding round corner to the cell
       CellView.layer.cornerRadius = 8
        CellView.layer.masksToBounds  = true
        CellView.layer.borderWidth = 2
        CellView.layer.borderColor = UIColor.init(red: 240, green: 240, blue: 240, alpha: 1).cgColor
       CellView.clipsToBounds = false
        
        // applaying the shadow
        CellView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        CellView.layer.shadowRadius = 4
        CellView.layer.shadowOpacity = 1
        CellView.layer.shadowOffset = CGSize(width: 0, height: 4)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
}
