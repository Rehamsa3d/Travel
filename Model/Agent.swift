//
//  Agent.swift
//  Travel
//
//  Created by ahmedxiio on 4/12/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import Foundation
import SwiftyJSON
class Agent: NSObject {
    //Mark : Properities
    var id: Int?
    var name: String?
    var email: String?
    var phone: String?
    var activation:Int?
    var type:Int?
    var AgentImageURL: String?
    var coverURL:String?
    var website:String?
    var address:String?
    var gender:String?
    var social_id:Int?
    var social_type:String?
    var reset_password_code:Int?
    var api_token:String?
    var ios_token:String?
    var trips_count:Int?
    var followers_count:Int?
    var agent_rate:Double?
    
    init(with json: JSON) {
        
        self.id = json["id"].int
        self.name = json["name"].string
        self.email = json["email"].string
        self.phone = json["phone"].string
        self.activation = json["activation"].int
        self.type = json["type"].int
        self.website = json["website"].string
        self.address = json["address"].string
        self.gender = json["gender"].string
        self.social_id = json["social_id"].int
        self.social_type = json["social_type"].string
        self.reset_password_code = json["reset_password_code"].int
        self.api_token = json["api_token"].string
        self.ios_token = json["ios_token"].string
        self.trips_count = json["trips_count"].int
        self.followers_count = json["followers_count"].int
        self.agent_rate = json["agent_rate"].double
        
        
        if let image = json["image"].string {
            
            self.AgentImageURL = baseUrl + image
        }
        if let cover = json["cover"].string {
            
            self.coverURL = baseUrl + cover
        }
        
    }
    
    
}

/*
 "agent": {
 "id": 4,
 "name": "hazoooom",
 "email": "hazem1@hazem.com",
 "phone": "01025880800",
 "activation": 1,
 "type": 2,
 "image": "storage/JtMh9gHSByrkIvJjjOUmxU6WhiCOXBFEs2vraFWI.jpeg",
 "cover": "img/default-cover-profile.jpg",
 "website": "https://www.hazem.com",
 "address": "3, st rashdan, dokki, cairo",
 "gender": "2",
 "social_id": null,
 "social_type": null,
 "reset_password_code": null,
 "api_token": "f4863d80397be4029a2ad51a8e7ce783",
 "android_token": null,
 "ios_token": null,
 "created_at": "2018-03-03 13:59:12",
 "updated_at": "2018-04-04 15:28:41",
 "trips_count": 9,
 "followers_count": 7,
 "agent_rate": 2.32592222222
 }
 */
