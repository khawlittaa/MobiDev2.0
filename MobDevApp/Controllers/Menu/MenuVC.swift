//
//  MenuVC.swift
//  MobDevApp
//
//  Created by Admin on 3/10/19.
//  Copyright © 2019 khawla. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {
    
    static let shared = MenuVC()
    
    @IBOutlet weak var ListdesPlats: UITableView!
    
    var dishes : [Plat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ListdesPlats.delegate = self
        ListdesPlats.dataSource = self
        
        // registering cell to use later
        let nib = UINib.init(nibName: "DishCell", bundle: nil)
        self.ListdesPlats.register(nib, forCellReuseIdentifier: "DishCell")
        let Plat1 = Plat(name : "Slade Mechwiya",monImage: "mechwiya", description: "La Slata méchwiya, qui se traduit en « Salade Grillée », est une Salade typiquement tunisienne qui se fait essentiellement de piments ou  de poivrons (suivant le goût).", type: "Entree", calories: "123 kcal", lipides: "9g", glucides: "7g", prix: "3dt", pourDiabetique: true, pourTension: true)
        
        let Plat2 = Plat(name : "Brika", monImage: "brik", description: "Le brick est une spécialité culinaire originaire du Maghreb. Ce terme sert à désigner la pâte très fine, faite à partir de farine de blé, d’eau et de sel mais aussi les feuilletés obtenus grâce à cette pâte", type: "Entree", calories: "285 kcal", lipides: "5g", glucides: "5g", prix: "1dt", pourDiabetique: true, pourTension: false)
        
        let Plat3 = Plat(name : "Couscous", monImage: "couscous", description: "Le couscous (en berbère : seksu ou keskesu1) est d'une part une semoule de blé dur préparée à l'huile d'olive (un des aliments de base traditionnel de la cuisine des pays du Maghreb) et d'autre part, une spécialité culinaire issue de la cuisine berbère, à base de couscous, de légumes, d'épices, d'huile d'olive, et de viande (mammifère ou volaille) ou de poisson.", type: "Suite", calories: "174 kcal", lipides: "9g", glucides: "2g", prix: "10dt", pourDiabetique: true, pourTension: false)
        
        let Plat4 = Plat(name : "Roti de veau", monImage: "veau", description: "Le veau est la viande des très jeunes bovins, en particulier des mâles, issus de troupeaux laitiers. Leurs muscles immatures sont particulièrement tendres, pour un prix généralement peu élevé.", type: "Suite", calories: "120 kcal", lipides: "4,0 g", glucides: "0g", prix: "15t", pourDiabetique: true, pourTension: false)
        
        let Plat5 = Plat(name : "Patisserie Tunisienne", monImage: "patisserie", description: "Les pâtisseries tunisiennes se préparent avec du miel, du sucre et beaucoup de fruits  secs. Elles sont parfumées à l’eau de rose ou à l’eau de fleur d’oranger.", type: "dessert", calories: "443 kcal", lipides: "20%", glucides: "35%", prix: "30dt", pourDiabetique: false, pourTension: false)
        
        dishes.append(Plat1)
        dishes.append(Plat2)
        dishes.append(Plat3)
        dishes.append(Plat4)
        dishes.append(Plat5)
        
        
        //dishes = ScaledElementProcessor.shared.Detectedtext
    }
}

// MARK: - UITableViewDelegate

extension MenuVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
// MARK: - UITableViewDataSource
extension MenuVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ListdesPlats.dequeueReusableCell(withIdentifier: "DishCell", for: indexPath) as! DishCell
        cell.setCorners()
        cell.Updatcell(Name: dishes[indexPath.row].name, Type: dishes[indexPath.row].type, Img: dishes[indexPath.row].monImage, price: dishes[indexPath.row].prix )
        
        return cell
    }
    // desplaying the detils view when a cell is selcted
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        details.dish = dishes[indexPath.row]
        self.navigationController?.pushViewController(details, animated: true)
    }
    
    
}
