//
//  DataServiceExtintion+Events&EventsSearch.swift
//  Travel
//
//  Created by ahmedxiio on 4/11/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire
extension DataService {
    
    class func getCityEvents(city_id: Int, completion: @escaping (_ error :Error? , _ event :[Events]? )->Void){
        
        let url = "\(apiUrl)app/city/\(city_id)"
        
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
                
                var events = [Events]()
                
                for item in jsonArr {
                    
                    let event = Events(with: item)
                    events.append(event)
                }
                
                completion(nil, events)
            }
        }
    }
    class func getInternalEvent(event_id: Int, completion: @escaping (_ error :Error? , _ event :[Events]? )->Void){
        
        let url = "\(apiUrl)app/event-info/\(event_id)"
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
                
                var events = [Events]()
                
                for item in jsonArr {
                    
                    let event = Events(with: item)
                    events.append(event)
                }
                
                completion(nil, events)
            }
        }
    }
    class func getEvents(completion: @escaping (_ error :Error? , _ event :[Events]? )->Void){
        
        let url = "\(apiUrl)app/events"
        
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
