//
//  View1VC.swift
//  MobiDev
//
//  Created by Ons Boukhdhir on 3/10/19.
//  Copyright © 2019 Ons Boukhdhir. All rights reserved.
//

import UIKit

class View1VC: UIViewController {

    @IBOutlet weak var btnResto: UIButton!
    @IBOutlet weak var btnMedical: UIButton!
    @IBOutlet weak var btnMenu: UIButton!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnBorder()
        // Do any additional setup after loading the view.
    }
    func btnBorder(){

        btnMenu.layer.cornerRadius = 15
        btnMenu.layer.borderWidth = 1
        btnMenu.titleEdgeInsets = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1);
        btnMenu.layer.borderColor = UIColor(red: 26.0/255.0, green: 188.0/255.0, blue: 156.0/255.0, alpha: 1.0).cgColor
        
        btnResto.layer.cornerRadius = 15
        btnResto.layer.borderWidth = 1
        btnResto.titleEdgeInsets = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1);
        btnResto.layer.borderColor = UIColor(red: 26.0/255.0, green: 188.0/255.0, blue: 156.0/255.0, alpha: 1.0).cgColor
        
        btnMedical.layer.cornerRadius = 15
        btnMedical.layer.borderWidth = 1
        btnMedical.titleEdgeInsets = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1);
        btnMedical.layer.borderColor = UIColor(red: 26.0/255.0, green: 188.0/255.0, blue: 156.0/255.0, alpha: 1.0).cgColor
    }
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            let url: NSURL = URL(string: "TEL://198")! as NSURL
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func restauAction(_ sender: Any) {
        let homeVC = UIStoryboard(name: "Restaurants", bundle: nil)
        let restauVC = homeVC.instantiateViewController(withIdentifier: "restauID") as! TableViewController
        self.navigationController?.pushViewController(restauVC, animated: true)
    }
    
    @IBAction func menuAction(_ sender: Any) {
        let menuVC = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = menuVC.instantiateViewController(withIdentifier: "mainID") as! TextDetectionVC
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    
    @IBAction func medicalAction(_ sender: Any) {
        let hospitalVC = UIStoryboard(name: "view1", bundle: nil).instantiateViewController(withIdentifier: "hospitalID") 
        self.navigationController?.pushViewController(hospitalVC, animated: true)
    }
}
