//
//  DataServiceExtintion+filtration.swift
//  Travel
//
//  Created by ahmedxiio on 4/15/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import Foundation
import Foundation
import UIKit
import SwiftyJSON
import Alamofire
extension DataService {
    
    //latest
    class func getFilteration(filter:String,completion: @escaping (_ error :Error? , _ event :[Events]? )->Void){
        
        let url = "\(apiUrl)app/events?filter=\(filter)"
        Alamofire.request(url, method: .get ,headers: ["Acc":"Application/json"]).responseJSON { response in

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

                var events = [Events]()

                for item in jsonArr {

                    let event = Events(with: item)
                    events.append(event)
                }

                completion(nil, events)
            }
        }
    }

    
}

