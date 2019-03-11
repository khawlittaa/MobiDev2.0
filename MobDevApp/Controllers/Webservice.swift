//
//  Webservice.swift
//  MobiDevApp
//
//  Created by Hadil on 3/10/19.
//  Copyright © 2019 Hadil. All rights reserved.
//

import Foundation
import Alamofire
class WebService
{
    static func AlamofireRequest(url:String, getRest:@escaping (([Resto]), _ success :Bool )->()) {
        var Rests: [Resto] = []
        var success=true
        
        Alamofire.request(url).responseJSON { response in
            //FIXME: must parse data into models
            //TODO: show tableView
            
            if  var jsondata = response.result.value as? [String:Any?]{
                
                let status=jsondata["status"] as? String
                print(status ?? "noresult")
                
                if status != "OK"{
                    
                    SecondRequest(getR: getRest)
                }else{
                    let  res=jsondata["results"] as? [[String:Any?]]
                    // print("JSONDAT = \(res!.count)")
                    for data in res!{
                        Rests.append(Resto(withDictionary: data))
                    }
                }
            }
            else{
                success=false
                
                
            }
            getRest(Rests,success)
        }
        
    }
    
    static func SecondRequest(getR:@escaping (([Resto]), _ success :Bool )->()) {
        let success=true
        var Rests: [Resto] = []
        Alamofire.request("https://demo1104843.mockable.io/NewAPI").responseJSON { response in
            if  let jsondata = response.result.value as? [String:Any?]{
                let  res=jsondata["results"] as? [[String:Any?]]
                //print("JSONDAT = \(res!.count)")
                for data in res!{
                    Rests.append(Resto(withDictionary: data))
                }
                getR(Rests,success)
                
            }
        }
        
    }
    
    
    
    
    
}


