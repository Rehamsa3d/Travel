//
//  DataService.swift
//  Travel
//
//  Created by ahmedxiio on 4/10/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire

// Get City Information from DataService

class DataService:NSObject {
    
    class func getCity(completion: @escaping (_ error :Error? , _ city :[City]? )->Void){
        
        let url = "\(apiUrl)app/cities"
        
        Alamofire.request(url, method: .get).responseJSON { response in
            
            switch response.result{
                
            case .failure(let error):
                
                completion(error, nil)
                print(error)
                
            case .success(let value):
                
                let json = JSON(value)
                
                guard let jsonArr = json.array else{
                    
                    completion(nil, nil)
                    
                    return
                }
                
                var cities = [City]()
                
                for item in jsonArr {
                    
                    let city = City(with: item)
                    cities.append(city)
                }
                
                completion(nil, cities)
            }
        }
    }
}

