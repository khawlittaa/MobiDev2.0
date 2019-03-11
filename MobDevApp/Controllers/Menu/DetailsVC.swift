//
//  DetailsVC.swift
//  MobDevApp
//
//  Created by Admin on 3/10/19.
//  Copyright © 2019 khawla. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
   var  dish: Plat?
    
    @IBOutlet weak var DishImg: UIImageView!
    @IBOutlet weak var DishDesc: UITextView!
    @IBOutlet weak var calorisLbl: UILabel!
    @IBOutlet weak var lipidesLbl: UILabel!
    @IBOutlet weak var glucidesLbl: UILabel!
    @IBOutlet weak var DishName: UILabel!
    @IBOutlet weak var diabeteLbl: UILabel!
    @IBOutlet weak var tensionLbl: UILabel!
    @IBOutlet weak var detailsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsView.layer.cornerRadius = 8
        detailsView.layer.masksToBounds  = true
        DishDesc.layer.cornerRadius = 8
        DishDesc.layer.masksToBounds  = true
        DishImg.layer.cornerRadius = 8
        DishImg.layer.masksToBounds  = true
        setData()
    }
 
   func  setData(){
    DishImg.image = UIImage(named: (dish?.monImage)! )
    DishName.text = dish?.name
    calorisLbl.text = dish?.calories
    lipidesLbl.text = dish?.lipides
    glucidesLbl.text = dish?.glucides
    DishDesc.text = dish?.description
    if (!(dish?.pourDiabetique)!)
    {diabeteLbl.text = "N'est pas consillé pour les diabétiques "
    diabeteLbl.textColor = UIColor.red
    }
    if (!(dish?.pourTension)!)
    {tensionLbl.text = "N'est pas consillé pour la surTension "
    tensionLbl.textColor = UIColor.red
    }
    
    }

}
